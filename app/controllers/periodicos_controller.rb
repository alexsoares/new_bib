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

  def create_local
    @localizacao = Localizacao.new(params[:localizacao])
    @localizacao.add_unidade(current_user.unidade_id)
    if @localizacao.save
      @localizacoes = Localizacao.all
      @periodicos = Periodico.new
      render :update do |page|
        page.replace_html 'local', :partial => "shared/campos/campos_local"
        page.replace_html 'aviso', :text => "NOVA LOCALIZAÇÃO CADASTRADA, CONTINUE O CADASTRO"
      end

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

def consultaPer
 if (params[:search].nil? || params[:search].empty?)
   $t=01;
    #@periodicos = Periodico.paginate :page => params[:page], :order => 'titulo ASC', :per_page => 10
    @periodicos = Periodico.paginate :page => params[:page], :per_page => 10, :conditions => ["titulo like ? ", ""],:order => 'titulo ASC'
 else if params[:type_of].to_i == 1
       $t=0;
       @periodicos = Periodico.paginate :page => params[:page], :per_page => 10, :conditions => ["titulo like ? and periodicidade =?", "%" + params[:search].to_s + "%", "DIARIO"],:order => 'titulo ASC'
     else if params[:type_of].to_i == 2
         $t=0;
         @periodicos = Periodico.paginate :page => params[:page], :per_page => 10, :conditions => ["subtitulo like ? ", "%" + params[:search].to_s + "%"],:order => 'subtitulo ASC'
      else
         @periodicos = Periodico.paginate :page => params[:page], :per_page => 10, :order => 'titulo ASC'
     end
    end
  end
 end

  def load_resources
    @localizacoes = Localizacao.all
  end
end
