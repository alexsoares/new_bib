class JogosController < ApplicationController

  before_filter :login_required
  before_filter :load_resources

  def index
    @jogos = Jogo.paginate :page => params[:page], :order => 'nome ASC', :per_page => 10

  end

  def show
    @jogos = Jogo.find(params[:id])
  end

  def new
    @jogos = Jogo.new
  end

  def create
    @jogos = Jogo.new(params[:jogo])
    if @jogos.save
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @jogos
    else
      render :action => 'new'
    end
  end

def create_local
    @localizacao = Localizacao.new(params[:localizacao])
    @localizacao.add_unidade(current_user.unidade_id)
    if @localizacao.save
      @localizacoes = Localizacao.all
      @livro = Livro.new
      render :update do |page|
        page.replace_html 'local', :partial => "campos_local"
        page.replace_html 'aviso', :text => "NOVA LOCALIZAÇÃO CADASTRADA, CONTINUE O CADASTRO"
      end

    end
  end

  def edit
    @jogos = Jogo.find(params[:id])
  end

  def update
    @jogos = Jogo.find(params[:id])
    if @jogos.update_attributes(params[:jogo])
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @jogos
    else
      render :action => 'edit'
    end
  end

  def destroy
    @jogos = Jogo.find(params[:id])
    @jogos.destroy
    flash[:notice] = "EXCLUIDO COM SUCESSO."
    redirect_to jogos_url
  end

  def consultaJog
 if (params[:search].nil? || params[:search].empty?)
   $t=01;
   @jogos = Jogo.paginate :page => params[:page], :per_page => 10, :conditions => ["nome like ? ", ""],:order => 'nome ASC'
 else if params[:type_of].to_i == 1
       $t=0;
       @jogos = Jogo.paginate :page => params[:page], :per_page => 10, :conditions => ["nome like ? ", "%" + params[:search].to_s + "%"],:order => 'nome ASC'
     else if params[:type_of].to_i == 2
         $t=0;
         @jogos = Jogo.paginate :page => params[:page], :per_page => 10, :conditions => ["faixa_etaria like ? ", "%" + params[:search].to_s + "%"],:order => 'nome ASC'
      else
        @jogos = Jogo.paginate :page => params[:page], :per_page => 10, :order => 'nome ASC'
     end
    end
  end
 end

    protected

  def load_resources
     @localizacoes = Localizacao.all
  end

end
