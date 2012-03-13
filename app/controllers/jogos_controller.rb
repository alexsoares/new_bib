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
    qtd = params[:jogo][:qtde_jogos].to_i
    if qtd == 0
      qtd = 1
    end
    tombos = params[:jogo][:lista_tombos].split(";")
      i = 0
      qtd.times do
        @jogos = Jogo.new(params[:jogo])
        @jogos.usuario = current_user.id
        @jogos.unidade = current_user.unidade_id
        Log.gera_log("CRIACAO", "JOGOS", current_user.id,@jogos.id)
        if params[:jogo][:qtde_jogos].to_i == 0
          @jogos.qtde_jogos = 1
        else
          @jogos.qtde_jogos = params[:jogo][:qtde_jogos].to_i
        end

        @jogos.tombo_l = tombos[i]
        #@livros_cad << @livro.tombo_l
        if qtd == 1
          if @jogos.save
              flash[:notice] = "Successfully created audio visual."
              redirect_to @jogos
            else
              render :action => 'new'
          end
        else
          @jogos.save
        end
        i += 1
      end
      if qtd == 1
      else
        redirect_to jogos_cadastrados_jogos_path
      end
  end


def create_local
    @localizacao = Localizacao.new(params[:localizacao])
    @localizacao.add_unidade(current_user.unidade_id)
    if @localizacao.save
      @localizacoes = Localizacao.all
      @livro = Livro.new
      render :update do |page|
        page.replace_html 'local', :partial => "shared/campos_local"
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

  def jogos_cadastrados
    limit = Tombo.last(:conditions => ["user_id = ? and jogo_id is not null", current_user])
    @jogos_cad = Tombo.all(:conditions => ["user_id = ? and jogo_id is not null", current_user], :limit => limit.qtde_livro, :order => "id DESC")
  end

def consultaJog
 unless params[:search].present?
   if params[:type_of].to_i == 3
     @contador = Jogo.find(:all, :order => 'nome ASC')
     @jogos = Jogo.paginate :all, :page => params[:page], :per_page => 10,:order => 'nome ASC'
     render :update do |page|
       page.replace_html 'jogos', :partial => "jogos"
     end
   end
 else
    if params[:type_of].to_i == 1
        @contador = Jogo.find(:all, :conditions => ["nome like ? ", "%" + params[:search].to_s + "%"],:order => 'nome ASC')
        @jogos = Jogo.paginate :all,:page => params[:page], :per_page => 10, :conditions => ["nome like ? ", "%" + params[:search].to_s + "%"],:order => 'nome ASC'
        render :update do |page|
          page.replace_html 'jogos', :partial => "jogos"
        end
      else if params[:type_of].to_i == 2
        @contador = Jogo.find(:all, :conditions => ["faixa_etaria like ? ", "%" + params[:search].to_s + "%"],:order => 'nome ASC')
        @jogos = Jogo.paginate :all, :page => params[:page], :per_page => 10, :conditions => ["faixa_etaria like ? ", "%" + params[:search].to_s + "%"],:order => 'nome ASC'
          render :update do |page|
            page.replace_html 'jogos', :partial => "jogos"
          end
      end
    end
 end
end

    protected

  def load_resources
     @localizacoes = Localizacao.all
  end

end
