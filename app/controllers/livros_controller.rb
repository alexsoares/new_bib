class LivrosController < ApplicationController
  before_filter :login_required
  before_filter :load_resources
  def teste
    t = 0
    y = 0
    render :text => 'hg'
  end
  def index
    @livros = Livro.all
  end

  def show
    @livro = Livro.find(params[:id])
  end

  def new
    @livro = Livro.new
    #1.times do
    #  assunto = @livro.assuntos.build
    #end
    #@assunto = Assunto.new
  end

  def create
    @livro = Livro.new(params[:livro])
    #p = params[:livro][:assuntos]
    #@assunto = @livro.assuntos.build(params[:assuntos]) unless params[:assuntos][:descricao].blank?
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
    flash[:notice] = "APAGADO COM SUCESSO."
    redirect_to livros_url
  end
  def visualizar_check
    if params[:livro_assunto_id].to_i == 1
      render :partial => "check"
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

  protected

  def load_resources
    @assuntos = Assunto.all
    @identificacoes  = Identificacao.all
    @areas = Area.all(:order => 'nome ASC')
    @editoras = Editora.all(:order => 'nome ASC') 
    @localizacoes = Localizacao.all(:conditions => ['unidade_id = ?', current_user.unidade_id])
    
  end
end
