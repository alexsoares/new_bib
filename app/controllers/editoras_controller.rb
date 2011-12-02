class EditorasController < ApplicationController
  def index
    @editoras = Editora.all
  end

  def show
    @editora = Editora.find(params[:id])
  end

  def new
    @editora = Editora.new
  end

  def create
    @editora = Editora.new(params[:editora])
    if @editora.save
      flash[:notice] = "CASTRADO COM SUCESSO."
      redirect_to @editora
    else
      render :action => 'new'
    end
  end

  def edit
    @editora = Editora.find(params[:id])
  end

  def update
    @editora = Editora.find(params[:id])
    if @editora.update_attributes(params[:editora])
      flash[:notice] = "CASTRADO COM SUCESSO."
      redirect_to @editora
    else
      render :action => 'edit'
    end
  end

  def destroy
    @editora = Editora.find(params[:id])
    @editora.destroy
    flash[:notice] = "EXCLUIDO COM SUCESSO."
    redirect_to editoras_url
  end
end
