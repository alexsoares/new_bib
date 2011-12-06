class MapasController < ApplicationController

  before_filter :login_required
  before_filter :load_resources

  def index
    @mapas = Mapas.paginate :page => params[:page], :order => 'titulo ASC', :per_page => 10

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
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @mapas
    else
      render :action => 'new'
    end
  end

def create_local
    @localizacao = Localizacao.new(params[:localizacao])
    @localizacao.add_unidade(current_user.unidade_id)
    if @localizacao.save
      @localizacoes = Localizacao.all
      @mapas = Mapas.new
      render :update do |page|
        page.replace_html 'local', :partial => "campos_local"
        page.replace_html 'aviso', :text => "NOVA LOCALIZAÇÃO CADASTRADA, CONTINUE O CADASTRO"
      end

    end
  end

  def edit
    @mapas = Mapas.find(params[:id])
  end

  def update
    @mapas = Mapas.find(params[:id])
    if @mapas.update_attributes(params[:mapas])
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @mapas
    else
      render :action => 'edit'
    end
  end

  def destroy
    @mapas = Mapas.find(params[:id])
    @mapas.destroy
    flash[:notice] = "EXCLUIDO COM SUCESSO."
    redirect_to mapas_url
  end

    protected

  def load_resources
    @editoras = Editora.all(:order => 'nome ASC')
    @localizacoes = Localizacao.all
  end

end
