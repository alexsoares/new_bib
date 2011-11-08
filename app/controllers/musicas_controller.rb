class MusicasController < ApplicationController
  def index
    @musicas = Musica.all
  end

  def show
    @musica = Musica.find(params[:id])
  end

  def new
    @musica = Musica.new
  end

  def create
    @musica = Musica.new(params[:musica])
    if @musica.save
      flash[:notice] = "Successfully created musica."
      redirect_to @musica
    else
      render :action => 'new'
    end
  end

  def edit
    @musica = Musica.find(params[:id])
  end

  def update
    @musica = Musica.find(params[:id])
    if @musica.update_attributes(params[:musica])
      flash[:notice] = "Successfully updated musica."
      redirect_to @musica
    else
      render :action => 'edit'
    end
  end

  def destroy
    @musica = Musica.find(params[:id])
    @musica.destroy
    flash[:notice] = "Successfully destroyed musica."
    redirect_to musicas_url
  end
end
