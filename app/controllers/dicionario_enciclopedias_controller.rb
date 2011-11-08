class DicionarioEnciclopediasController < ApplicationController
  def index
    @dicionario_enciclopedias = DicionarioEnciclopedia.all
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
      flash[:notice] = "Successfully created dicionario enciclopedia."
      redirect_to @dicionario_enciclopedia
    else
      render :action => 'new'
    end
  end

  def edit
    @dicionario_enciclopedia = DicionarioEnciclopedia.find(params[:id])
  end

  def update
    @dicionario_enciclopedia = DicionarioEnciclopedia.find(params[:id])
    if @dicionario_enciclopedia.update_attributes(params[:dicionario_enciclopedia])
      flash[:notice] = "Successfully updated dicionario enciclopedia."
      redirect_to @dicionario_enciclopedia
    else
      render :action => 'edit'
    end
  end

  def destroy
    @dicionario_enciclopedia = DicionarioEnciclopedia.find(params[:id])
    @dicionario_enciclopedia.destroy
    flash[:notice] = "Successfully destroyed dicionario enciclopedia."
    redirect_to dicionario_enciclopedias_url
  end
end
