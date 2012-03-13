class ConfiguracoesController < ApplicationController
  def index
    @configuracaos = Configuracao.all(:conditions => ["unidade_id = ?", current_user.unidade_id])
  end

  def show
    @configuracao = Configuracao.find(params[:id])
  end

  def new
    @configuracao = Configuracao.new
  end

  def create   
    @configuracao = Configuracao.new(params[:configuracao])
    @configuracao.unidade_id = current_user.unidade_id
    if @configuracao.save
      flash[:notice] = "CADASTRADO COM SUCESSO."
      Log.gera_log("CRIACAO", "CONFIGURACAO", current_user.id,@configuracao.id)
      redirect_to @configuracao
    else
      render :action => 'new'
    end
  end

  def edit
    @configuracao = Configuracao.find(params[:id])
  end

  def update
    @configuracao = Configuracao.find(params[:id])
    if @configuracao.update_attributes(params[:configuracao])
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @configuracao
    else
      render :action => 'edit'
    end
  end

  def destroy
    @configuracao = Configuracao.find(params[:id])
    @configuracao.destroy
    flash[:notice] = "EXCLUIDO COM SUCESSO."
    redirect_to configuracaos_url
  end
end
