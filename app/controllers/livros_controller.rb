class LivrosController < ApplicationController
  before_filter :login_required
  before_filter :load_resources
  def index
    @livros = Livro.all
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
    u = params[:livro_assunto_id]
    if params[:livro_assunto_id].to_i == 1
      t = 0
      render partial => "check"
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
