class JogosController < ApplicationController
  def index
    @jogos = Jogo.all
  end

  def show
    @jogos = Jogo.find(params[:id])
  end

  def new
    @jogos = Jogo.new
  end

  def create
    @jogos = Jogo.new(params[:jogos])
    if @jogos.save
      flash[:notice] = "Successfully created jogos."
      redirect_to @jogos
    else
      render :action => 'new'
    end
  end

  def edit
    @jogos = Jogo.find(params[:id])
  end

  def update
    @jogos = Jogo.find(params[:id])
    if @jogos.update_attributes(params[:jogos])
      flash[:notice] = "Successfully updated jogos."
      redirect_to @jogos
    else
      render :action => 'edit'
    end
  end

  def destroy
    @jogos = Jogo.find(params[:id])
    @jogos.destroy
    flash[:notice] = "Successfully destroyed jogos."
    redirect_to jogos_url
  end
end
