class AutoresController < ApplicationController
  def index
    @autores = Autor.paginate :page => params[:page], :order => 'nome ASC', :per_page => 10
    
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
    flash[:notice] = "EXCLUIDO COM SUCESSO."
    redirect_to autores_url
  end
end
