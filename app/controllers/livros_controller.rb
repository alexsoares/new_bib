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
      flash[:notice] = "Successfully created livro."
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
      flash[:notice] = "Successfully updated livro."
      redirect_to @livro
    else
      render :action => 'edit'
    end
  end

  def destroy
    @livro = Livro.find(params[:id])
    @livro.destroy
    flash[:notice] = "Successfully destroyed livro."
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
        page.replace_html 'aviso', :text => "Assunto Criado, continue o cadastro. Lembre-se selecione o assunto."
      end

    end
  end
  def create_local
    @localizacao = Localizacao.new(params[:localizacao])
    if @localizacao.save
      @localizacoes = Localizacao.all
      @livro = Livro.new
      render :update do |page|
        page.replace_html 'local', :partial => "campos_local"
        page.replace_html 'aviso', :text => "Nova localização Cadastrada, continue o cadastro."
      end

    end
  end

  protected

  def load_resources
    @assuntos = Assunto.all
    @identificacoes  = Identificacao.all
    @areas = Area.all
    @editoras = Editora.all
    @localizacoes = Localizacao.all
    
  end
end
