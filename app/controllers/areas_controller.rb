class AreasController < ApplicationController
  def index
    @areas = Area.all
  end

  def show
    @area = Area.find(params[:id])
  end

  def new
    @area = Area.new
  end

  def create
    @area = Area.new(params[:area])
    if @area.save
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @area
    else
      render :action => 'new'
    end
  end

  def edit
    @area = Area.find(params[:id])
  end

  def update
    @area = Area.find(params[:id])
    if @area.update_attributes(params[:area])
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @area
    else
      render :action => 'edit'
    end
  end

  def destroy
    @area = Area.find(params[:id])
    @area.destroy
    flash[:notice] = "EXCLUIDO COM SUCESSO."
    redirect_to areas_url
  end
end
