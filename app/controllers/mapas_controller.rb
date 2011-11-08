class MapasController < ApplicationController
  def index
    @mapas = Mapas.all
  end

  def show
    @mapas = Mapas.find(params[:id])
  end

  def new
    @mapas = Mapas.new
  end

  def create
    @mapas = Mapas.new(params[:mapas])
    if @mapas.save
      flash[:notice] = "Successfully created mapas."
      redirect_to @mapas
    else
      render :action => 'new'
    end
  end

  def edit
    @mapas = Mapas.find(params[:id])
  end

  def update
    @mapas = Mapas.find(params[:id])
    if @mapas.update_attributes(params[:mapas])
      flash[:notice] = "Successfully updated mapas."
      redirect_to @mapas
    else
      render :action => 'edit'
    end
  end

  def destroy
    @mapas = Mapas.find(params[:id])
    @mapas.destroy
    flash[:notice] = "Successfully destroyed mapas."
    redirect_to mapas_url
  end
end
