class TombosController < ApplicationController
  require_role ["administrador"]
  before_filter :load_resources

  def index
    @tables = ActiveRecord::Base.connection.tables
  end

  def geral
    unidade = (params[:unidade][:id]).to_i
    @tombos_livros = Tombo.all(:include => [{:livro =>[:identificacao,:localizacao]}],:conditions => ["livro_id is not null and localizacoes.unidade_id = ?",unidade]).count
    @livros = Livro.all(:include => [[:identificacao,:localizacao]],:conditions => ["livros.id not in (select livro_id from tombos where livro_id is not null) and localizacoes.unidade_id = ?",unidade]).count
    @no_livros_tombos = Tombo.all(:include => [{:livro =>[:identificacao,:localizacao]}],:conditions => ["(livro_id not in (select id from livros) and dicionario_enciclopedia_id is null) and localizacoes.unidade_id = ?",unidade]).count
    @tombos_de = Tombo.all(:include => [{:dicionario_enciclopedia =>[:identificacao,:localizacao]}],:conditions => ["dicionario_enciclopedia_id is not null and localizacoes.unidade_id = ?", unidade]).count
    @de = DicionarioEnciclopedia.all(:include => [:identificacao,:localizacao],:conditions => ["dicionario_enciclopedias.id not in (select dicionario_enciclopedia_id from tombos where dicionario_enciclopedia_id is not null) and localizacoes.unidade_id = ?",unidade]).count
    @no_de_tombos = 0#Tombo.all(:conditions => ["dicionario_enciclopedia_id not in (select id from dicionario_enciclopedias) and (dicionario_enciclopedia_id is null)"]).count
    render :update do |page|
      page.replace_html 'geral', :partial => "geral"
    end

  end

  def livros_diarios
    render :layout => "default"
  end

  def de_diarios
    render :layout => "default"
  end


  def usuario
    render :layout => "default"
    #@de = Tombo.all(:conditions => ["", anterior_inicio,(anterior_inicio + 23.hours + 59.minutes)])
  end

  def select_user
    unidade = params[:unidade][:id].to_i
    @no_livros_per_user = Tombo.find_all_by_user_id(params[:tombo][:user].to_i, :joins => [:user,{:livro =>[:localizacao]}], :conditions => ["livro_id not in (select id from livros) and localizacoes.unidade_id = ?", unidade])
    @livros_per_user = Tombo.find_all_by_user_id(params[:tombo][:user].to_i, :joins => [:user,{:livro =>[:localizacao]}], :conditions => ["livro_id in (select id from livros) and localizacoes.unidade_id = ?",unidade])
    render :update do |page|
      page.replace_html 'livro_per_user', :partial => "per_user"
      page.replace_html 'count', :text => "Total cadastrado: #{@livros_per_user.count + @no_livros_per_user.count} - #{@no_livros_per_user.count} = #{@livros_per_user.count} livros"
    end
  end


  def cad_livros_diario
    unidade = params[:unidade][:id].to_i
    @users = User.all(:conditions => ["activated_at is not null and unidade_id = ?", unidade],:order => 'login ASC')
    atual_inicio = Date.today + 0.hours
    anterior_inicio = atual_inicio - 1.day
    @atual = Tombo.all(:joins => [{:livro => [:localizacao]}],:conditions => ["(tombos.created_at between ? and ?) and localizacoes.unidade_id = ?", atual_inicio,(atual_inicio + 23.hours + 59.minutes), unidade])
    @anterior = Tombo.all(:joins => [{:livro => [:localizacao]}],:conditions => ["(tombos.created_at between ? and ?) and localizacoes.unidade_id = ?", anterior_inicio,(anterior_inicio + 23.hours + 59.minutes),unidade])
    render :update do |page|
      page.replace_html 'livro_diario', :partial => "livros_diarios", :unidade => unidade
    end
  end

  def cad_de_diario
    unidade = params[:unidade][:id].to_i
    @users = User.all(:conditions => ["activated_at is not null and unidade_id = ?", unidade],:order => 'login ASC')
    atual_inicio = Date.today + 0.hours
    anterior_inicio = atual_inicio - 1.day
    @atual = Tombo.all(:conditions => ["(created_at between ? and ?) and livro_id is null", atual_inicio,(atual_inicio + 23.hours + 59.minutes)])
    @anterior = Tombo.all(:conditions => ["(created_at between ? and ?) and livro_id is null", anterior_inicio,(anterior_inicio + 23.hours + 59.minutes)])
    render :update do |page|
      page.replace_html 'de_diario', :partial => "de_diarios", :unidade => unidade
    end
  end



  protected

  def load_resources
    @users = User.all(:conditions => ["activated_at is not null"],:order => 'login ASC')
  end
end
