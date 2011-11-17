class LocalizacoesController < ApplicationController
  def index
    @localizacoes = Localizacao.all
  end

  def show
    @localizacao = Localizacao.find(params[:id])
  end

  def new
    @localizacao = Localizacao.new
  end

  def create
    @localizacao = Localizacao.new(params[:localizacao])
    @localizacao.add_unidade(current_user.unidade_id)   
    if @localizacao.save
      flash[:notice] = "Successfully created localizacao."
      redirect_to @localizacao
    else
      render :action => 'new'
    end
  end

  def edit
    @localizacao = Localizacao.find(params[:id])
  end

  def update
    @localizacao = Localizacao.find(params[:id])
    if @localizacao.update_attributes(params[:localizacao])
      flash[:notice] = "Successfully updated localizacao."
      redirect_to @localizacao
    else
      render :action => 'edit'
    end
  end

  def destroy
    @localizacao = Localizacao.find(params[:id])
    @localizacao.destroy
    flash[:notice] = "Successfully destroyed localizacao."
    redirect_to localizacoes_url
  end
end
