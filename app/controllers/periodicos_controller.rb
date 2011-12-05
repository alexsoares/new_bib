class PeriodicosController < ApplicationController

  before_filter :login_required
  before_filter :load_resources

  def index
    @periodicos = Periodico.paginate :page => params[:page], :order => 'titulo ASC', :per_page => 10
    
  end

  def show
    @periodicos = Periodico.find(params[:id])
  end

  def new
    @periodicos = Periodico.new
  end

  def create
    @periodicos = Periodico.new(params[:periodico])
    if @periodicos.save
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @periodicos
    else
      render :action => 'new'
    end
  end

  def edit
    @periodicos = Periodico.find(params[:id])
  end

  def update
    @periodicos = Periodico.find(params[:id])
    if @periodicos.update_attributes(params[:periodico])
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @periodicos
    else
      render :action => 'edit'
    end
  end

  def destroy
    @periodicos = Periodico.find(params[:id])
    @periodicos.destroy
    flash[:notice] = "EXCLUIDO COM SUCESSO."
    redirect_to periodicos_url
  end

  def load_resources
    @localizacoes = Localizacao.all
  end
end
