class FuncionariosController < ApplicationController
  before_filter :load_resources
  def index
    @funcionarios = Funcionario.all
  end

  def show
    @funcionario = Funcionario.find(params[:id])
  end

  def new
    @funcionario = Funcionario.new
  end

  def create
    @funcionario = Funcionario.new(params[:funcionario])
    if @funcionario.save
      flash[:notice] = "Successfully created funcionario."
      redirect_to @funcionario
    else
      render :action => 'new'
    end
  end

  def edit
    @funcionario = Funcionario.find(params[:id])
  end

  def update
    @funcionario = Funcionario.find(params[:id])
    if @funcionario.update_attributes(params[:funcionario])
      flash[:notice] = "Successfully updated funcionario."
      redirect_to @funcionario
    else
      render :action => 'edit'
    end
  end

  def destroy
    @funcionario = Funcionario.find(params[:id])
    @funcionario.destroy
    flash[:notice] = "Successfully destroyed funcionario."
    redirect_to funcionarios_url
  end
  protected
  def load_resources
    @unidades = Unidade.all
  end
end
