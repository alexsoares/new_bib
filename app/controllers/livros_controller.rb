class LivrosController < ApplicationController
  before_filter :login_required
  before_filter :load_resources
  def index
    @livros = Livro.paginate :page => params[:page], :per_page => 10, :joins => :identificacao, :order => 'livro ASC'

  end

  def show
    @livro = Livro.find(params[:id])
  end

  def new
    @livro = Livro.new

  end

  def create
    @livro = Livro.new(params[:livro])

    if @livro.save
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @livro
    else
      render :action => 'new'
    end
  end

  def edit
    @livro = Livro.find(params[:id])
  end

  def update
    @livro = Livro.find(params[:id])
    if @livro.update_attributes(params[:livro])
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @livro
    else
      render :action => 'edit'
    end
  end

  def destroy
    @livro = Livro.find(params[:id])
    @livro.destroy
    flash[:notice] = "EXCLUIDO COM SUCESSO."
    redirect_to livros_url
  end

  def visualizar_check
    if params[:livro_assunto_id].to_i == 1
      render :partial => "check"
    end
  end


  def filtrar    
    if params[:busca].present?
      @identificacoes = Identificacao.all(:conditions =>["livro like ?", ""+params[:busca][:busca]+"%"])
    end
      @livro = Livro.new
      render :update do |page|
        page.replace_html 'ident', :partial => "campos_identificacao"
        page.replace_html 'aviso', :text => "Filtrado!"
      end

  end

    def create_autor
    @autor = Autor.new(params[:autor])
    if @autor.save
      @autores = Autor.all
      @livro = Livro.new
      render :update do |page|
        page.replace_html 'autores', :partial => "campos_autor"
        page.replace_html 'aviso', :text => "AUTOR CADASTRADO, CONTINUE O CADASTRO. LEMBRE-SE DE SELECIONAR O AUTOR"
      end

    end
  end

  def create_assunto
    @assunto = Assunto.new(params[:assunto])
    if @assunto.save
      @assuntos = Assunto.all
      @livro = Livro.new
      render :update do |page|
        page.replace_html 'assuntos', :partial => "campos_assunto"
        page.replace_html 'aviso', :text => "ASSUNTO CADASTRADO, CONTINUE O CADASTRO. LEMBRE-SE DE SELECIONAR O ASSUNTO"
      end

    end
  end
  
  def create_local
    @localizacao = Localizacao.new(params[:localizacao])
    @localizacao.add_unidade(current_user.unidade_id)
    if @localizacao.save
      @localizacoes = Localizacao.all
      @livro = Livro.new
      render :update do |page|
        page.replace_html 'local', :partial => "campos_local"
        page.replace_html 'aviso', :text => "NOVA LOCALIZAÇÃO CADASTRADA, CONTINUE O CADASTRO"
      end

    end
  end


 def subtitulo
  session[:identificacao] = params[:livro_identificacao_id]
   #@identificacao = Identificacao.find(:all, :conditions => ["id=?", session[:identificacao]])
   @identificacao = Identificacao.find_by_id(session[:identificacao]).subtitulo
   #$teste = @identificacao.subtitulo
   render :partial => 'subtitulo'

   end

  protected

  def load_resources
    @assuntos = Assunto.all
    @identificacoes  = Identificacao.all(:order => 'livro ASC')
    @autores  = Autor.all
    @areas = Area.all(:order => 'nome ASC')
    @editoras = Editora.all(:order => 'nome ASC') 
    @localizacoes = Localizacao.all(:conditions => ['unidade_id = ?', current_user.unidade_id])
    
  end
end
