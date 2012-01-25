class TombosController < ApplicationController
  before_filter :load_resources
  def index
    @tombos_livros = Tombo.all(:conditions => ["livro_id is not null"]).count
    @tombos_de = Tombo.all(:conditions => ["dicionario_enciclopedia_id is not null"]).count
    @livros = Livro.all(:conditions => ["id not in (select livro_id from tombos where livro_id is not null)"]).count
    @de = DicionarioEnciclopedia.all.count
    @no_livros_tombos = Tombo.all(:conditions => ["livro_id not in (select id from livros) and dicionario_enciclopedia_id is null"]).count
    @no_de_tombos = Tombo.all(:conditions => ["dicionario_enciclopedia_id not in (select id from dicionario_enciclopedias) and livro_id is null"]).count
  end

  def livros_diarios
    render :layout => "default"
    atual_inicio = Date.today + 0.hours - 6.days
    anterior_inicio = atual_inicio - 1.day
    @atual = Tombo.all(:conditions => ["(created_at between ? and ?) and dicionario_enciclopedia_id is null", atual_inicio,(atual_inicio + 23.hours + 59.minutes)])
    @anterior = Tombo.all(:conditions => ["(created_at between ? and ?) and dicionario_enciclopedia_id is null", anterior_inicio,(anterior_inicio + 23.hours + 59.minutes)])
  end

  def de_diarios
    render :layout => "default"
    atual_inicio = Date.today + 0.hours - 6.days
    anterior_inicio = atual_inicio - 1.day
    @atual = Tombo.all(:conditions => ["(created_at between ? and ?) and livro_id is null", atual_inicio,(atual_inicio + 23.hours + 59.minutes)])
    @anterior = Tombo.all(:conditions => ["(created_at between ? and ?) and livro_id is null", anterior_inicio,(anterior_inicio + 23.hours + 59.minutes)])
  end


  def usuario
    @de = Tombo.all(:conditions => ["", anterior_inicio,(anterior_inicio + 23.hours + 59.minutes)])
  end


  def usuario
    render :layout => "default"
  end

  def select_user
#    @no_tombo_per_user = Tombo.find_all_by_user_id(params[:tombo][:user], :include => [:user,:livro,:dicionario_enciclopedia], :conditions => ["(livro_id not in (select id from livros)) or (dicionario_enciclopedia_id not in (select id from dicionario_enciclopedias))"])
#    @cad_per_user = Tombo.find_all_by_user_id(params[:tombo][:user], :include => [:user,:livro,:dicionario_enciclopedia], :conditions => ["(livro_id in (select id from livros)) or (dicionario_enciclopedia_id in (select id from dicionario_enciclopedias))"])

#    render :update do |page|
#      page.replace_html 'livro_per_user', :partial => "per_user"
#      page.replace_html 'count', :text => "Total cadastrado: #{@cad_per_user.count + @no_tombo_per_user.count} - #{@no_tombo_per_user.count} = #{@cad_per_user.count} livros"
#    end


    @no_livros_per_user = Tombo.find_all_by_user_id(params[:tombo][:user], :include => [:user,:livro], :conditions => ["livro_id not in (select id from livros)"])
    @livros_per_user = Tombo.find_all_by_user_id(params[:tombo][:user], :include => [:user,:livro], :conditions => ["livro_id in (select id from livros)"])
    render :update do |page|
      page.replace_html 'livro_per_user', :partial => "per_user"
      page.replace_html 'count', :text => "Total cadastrado: #{@livros_per_user.count + @no_livros_per_user.count} - #{@no_livros_per_user.count} = #{@livros_per_user.count} livros"
    end

  end

  protected

  def load_resources
    @users = User.all(:conditions => ["activated_at is not null"])
  end
end
