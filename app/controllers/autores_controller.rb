class AutoresController < ApplicationController
  def index
    @autores = Autor.all
  end

  def show
    @autor = Autor.find(params[:id])
  end

  def new
    @autor = Autor.new
  end

  def create
    @autor = Autor.new(params[:autor])
    if @autor.save
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @autor
    else
      render :action => 'new'
    end
  end

  def edit
    @autor = Autor.find(params[:id])
  end

  def update
    @autor = Autor.find(params[:id])
    if @autor.update_attributes(params[:autor])
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @autor
    else
      render :action => 'edit'
    end
  end

  def destroy
    @autor = Autor.find(params[:id])
    @autor.destroy
    flash[:notice] = "APAGADO COM SUCESSO."
    redirect_to autores_url
  end
end
