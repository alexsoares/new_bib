class DicionarioEnciclopediasController < ApplicationController

  before_filter :login_required
  before_filter :load_resources

def consultaDic
 if (params[:search].nil? || params[:search].empty?)
   $t=01;
    @dicionario_enciclopedias = DicionarioEnciclopedia.paginate :page => params[:page], :per_page => 10, :joins => :identificacao,  :conditions => ["livro like ? ", ""],:order => 'livro ASC'
 else
    if params[:type_of].to_i == 1
     $t=0;
     @dicionario_enciclopedias = DicionarioEnciclopedia.find(:all, :joins => :identificacao, :conditions => ["livro like ? and tipo =?", "%" + params[:search].to_s + "%","DICIONÁRIO"], :order => 'livro ASC')
     else if params[:type_of].to_i == 2
       $t=0;
       @dicionario_enciclopedias = DicionarioEnciclopedia.find(:all, :joins => :identificacao, :conditions => ["livro like ? and tipo =?", "%" + params[:search].to_s + "%","ENCICLOPÉDIA"], :order => 'livro ASC')
       else if params[:type_of].to_i == 3
         $t=0;
         @dicionario_enciclopedias = DicionarioEnciclopedia.find(:all, :joins => :identificacao, :conditions => ["livro like ? and tipo =?", "%" + params[:search].to_s + "%","OUTROS"], :order => 'livro ASC')
       else
         @dicionario_enciclopedias = DicionarioEnciclopedia.paginate :page => params[:page], :per_page => 10, :joins => :identificacao, :order => 'livro ASC'
       end
      end
    end
  end
 end

  def index
    @dicionario_enciclopedias = DicionarioEnciclopedia.paginate :page => params[:page], :per_page => 10, :joins => :identificacao, :order => 'livro ASC'
  end

  def show
    @dicionario_enciclopedia = DicionarioEnciclopedia.find(params[:id])
  end

  def new
    @dicionario_enciclopedia = DicionarioEnciclopedia.new
  end

  def create
    @dicionario_enciclopedia = DicionarioEnciclopedia.new(params[:dicionario_enciclopedia])
    if @dicionario_enciclopedia.save
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @dicionario_enciclopedia
    else
      render :action => 'new'
    end
  end

def create_local
    @localizacao = Localizacao.new(params[:localizacao])
    @localizacao.add_unidade(current_user.unidade_id)
    if @localizacao.save
      @localizacoes = Localizacao.all
      @dicionario_enciclopedia = DicionarioEnciclopedia.new
      render :update do |page|
        page.replace_html 'local', :partial => "campos_local"
        page.replace_html 'aviso', :text => "NOVO DICIONÁRIO & ENCICLOPÉDIA CADASTRADO, CONTINUE O CADASTRO"
      end

    end
  end


  def filtrar
    if params[:busca].present?
      @identificacoes = Identificacao.all(:conditions =>["livro like ?", ""+params[:busca][:busca]+"%"])
    end
     @dicionario_enciclopedia = DicionarioEnciclopedia.new
      render :update do |page|
        page.replace_html 'ident', :partial => "campos_identificacao"
        page.replace_html 'aviso', :text => "Filtrado!"
      end

  end


  def edit
    @dicionario_enciclopedia = DicionarioEnciclopedia.find(params[:id])
  end

  def update
    @dicionario_enciclopedia = DicionarioEnciclopedia.find(params[:id])
    if @dicionario_enciclopedia.update_attributes(params[:dicionario_enciclopedia])
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @dicionario_enciclopedia
    else
      render :action => 'edit'
    end
  end

  def destroy
    @dicionario_enciclopedia = DicionarioEnciclopedia.find(params[:id])
    @dicionario_enciclopedia.destroy
    flash[:notice] = "EXCLUIDO COM SUCESSO."
    redirect_to dicionario_enciclopedias_url
  end

 def subtitulo
  session[:identificacao] = params[:dicionario_enciclopedia_identificacao_id]
   @identificacao = Identificacao.find_by_id(session[:identificacao]).subtitulo
   render :partial => 'subtitulo'
   end


    protected

  def load_resources
    @areas = Area.all(:order => 'nome ASC')
    @editoras = Editora.all(:order => 'nome ASC')
    @localizacoes = Localizacao.all
    @identificacoes  = Identificacao.all(:order => 'livro ASC')
  end

end
