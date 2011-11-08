class AudioVisuaisController < ApplicationController
  def index
    @audio_visuais = AudioVisual.all
  end

  def show
    @audio_visual = AudioVisual.find(params[:id])
  end

  def new
    @audio_visual = AudioVisual.new
  end

  def create
    @audio_visual = AudioVisual.new(params[:audio_visual])
    if @audio_visual.save
      flash[:notice] = "Successfully created audio visual."
      redirect_to @audio_visual
    else
      render :action => 'new'
    end
  end

  def edit
    @audio_visual = AudioVisual.find(params[:id])
  end

  def update
    @audio_visual = AudioVisual.find(params[:id])
    if @audio_visual.update_attributes(params[:audio_visual])
      flash[:notice] = "Successfully updated audio visual."
      redirect_to @audio_visual
    else
      render :action => 'edit'
    end
  end

  def destroy
    @audio_visual = AudioVisual.find(params[:id])
    @audio_visual.destroy
    flash[:notice] = "Successfully destroyed audio visual."
    redirect_to audio_visuais_url
  end
end
