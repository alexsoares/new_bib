class LivrosController < ApplicationController
  before_filter :login_required
  before_filter :load_resources

    def create_editora
      @editora = Editora.new(params[:editora])
      if @editora.save
        @livro = Livro.new
        render :update do |page|
          page.replace_html 'editora', :partial => "shared/campos/campos_editora"
          page.replace_html 'aviso', :text => "EDITORA CADASTRADA, CONTINUE O CADASTRO. LEMBRE-SE DE SELECIONAR A EDITORA"
        end

      end
      
    end

    def create_titulo
      @titulo = Identificacao.new(params[:titulo])
      if @titulo.save
        session[:identificacao_id] = @titulo.id
        @livro = Livro.new
        render :update do |page|
          page.replace_html 'aviso', :text => "Titulo Inserido, favor selecioná-lo"
          page.replace_html 'identificacao', :text => @titulo.livro
          page.replace_html 'subtitulo', :text => "<b>Subtitulo: </b>#{@titulo.subtitulo}"
        end
      end
    end




    def livro
    @livro = Identificacao.find(:all,:conditions => ["livro like ?",params[:nome_livro]+"%"])
    @livro_hash = []
    @livro.each do |id|
      @livro_hash <<  id.livro
    end
    respond_to do |format|
      format.js
      format.json  { render :json => @livro_hash.to_json }
      

    end
  end


  def index

       @contador = Livro.all.count
       @livros = Livro.paginate :all, :page => params[:page], :per_page => 50, :joins => :identificacao,:order => 'livro ASC'


      #@livro = Identificacao.all :order => 'livro ASC'
      #@livros = Livro.paginate :all, :page => params[:page], :per_page => 10

    #@livro_hash = []
    #@livro.each do |id|
    #  @livro_hash <<  id.livro
    #end

    respond_to do |format|
      format.html
      format.json { render :json => Identificacao.paginate(:page => params[:page], :per_page => 50) }
    #  format.js
    #  format.json  { render :json => @livro_hash }
    end

  end

  def show
    @livro = Livro.find(params[:id])
  end

  def new
    @livro = Livro.new
  end

  def create
    qtd = params[:livro][:qtde_livros].to_i
    if qtd == 0
      qtd = 1
    end
    tombos = params[:livro][:lista_tombos].split(";")
      i = 0
      @livros_cad = []
      qtd.times do
        @livro = Livro.new(params[:livro])
        Log.gera_log("CRIACAO", "LIVROS", current_user.id,@livro.id)
        @livro.identificacao_id = session[:identificacao_id]
        @livro.usuario = current_user.id
        @livro.unidade = current_user.unidade_id
        if params[:livro][:qtde_livros].to_i == 0
          @livro.qtde_livros = 1
        else
          @livro.qtde_livros = params[:livro][:qtde_livros].to_i
        end

        @livro.tombo_l = tombos[i]
        #@livros_cad << @livro.tombo_l
        @livro.save
        i += 1
      end
      session[:identificacao_id] = nil
        redirect_to livros_cadastrados_livros_path
      #render :action => 'livros_cadastrados', :collection => @livros_cad
  end


  def livros_cadastrados
    limit = Tombo.last(:conditions => ["user_id = ? and livro_id is not null", current_user])
    @livros_cad = Tombo.all(:conditions => ["user_id = ? and livro_id is not null", current_user], :limit => limit.qtde_livro, :order => "id DESC")
    t = 0
  end

  def edit
    @livro = Livro.find(params[:id])
    @autores_selecionados = @livro.autores
    @autores =  @autores - @autores_selecionados
    @assuntos_selecionados = @livro.assuntos
    @assuntos = @assuntos - @assuntos_selecionados
  end

  def update
    @livro = Livro.find(params[:id])
    if @livro.update_attributes(params[:livro])
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @livro
    else
      render :action => 'edit'
    end
  end

  def destroy
    @livro = Livro.find(params[:id])
    @livro.destroy
    flash[:notice] = "EXCLUIDO COM SUCESSO."
    redirect_to livros_url
  end

  def visualizar_check
    if params[:livro_assunto_id].to_i == 1
      render :partial => "check"
    end
  end

def consultaLiv
   unless params[:search].present?
     if params[:type_of].to_i == 6
       @contador = Livro.all.count
       @livros = Livro.paginate :all, :page => params[:page], :per_page => 50, :joins => :identificacao,:order => 'livro ASC'
       render :update do |page|
         page.replace_html 'livros', :partial => "livros"
       end
     end
   else
      if params[:type_of].to_i == 1
          @contador = Livro.all(:joins => :identificacao, :conditions => ["livro like ?", "%" + params[:search].to_s + "%"]).count
          @livros = Livro.paginate :all, :page => params[:page], :per_page => 50, :joins => :identificacao,  :conditions => ["livro like ? ", "%" + params[:search].to_s + "%"],:order => 'livro ASC'
          render :update do |page|
            page.replace_html 'livros', :partial => "livros"
          end
          else if params[:type_of].to_i == 2
            @contador = Livro.all(:joins => :area, :conditions => ["nome like ?", "%" + params[:search].to_s + "%"]).count
            @livros = Livro.paginate :all, :page => params[:page], :per_page => 50, :joins => :area,  :conditions => ["nome like ? ", "%" + params[:search].to_s + "%"],:order => 'nome ASC'
            render :update do |page|
              page.replace_html 'livros', :partial => "livros"
            end
            else if params[:type_of].to_i == 3
              @contador = Livro.all(:joins => :autores, :conditions => ["nome like ?", "%" + params[:search].to_s + "%"]).count
              @livros = Livro.paginate :all, :page => params[:page], :per_page => 50, :joins => :autores,  :conditions => ["nome like ? ", "%" + params[:search].to_s + "%"],:order => 'nome ASC'
              render :update do |page|
                page.replace_html 'livros', :partial => "livros"
              end
              else if params[:type_of].to_i == 4
                @contador = Livro.all(:joins => :assuntos, :conditions => ["descricao like ?", "%" + params[:search].to_s + "%"]).count
                @livros = Livro.paginate :page => params[:page], :per_page => 50, :joins => :assuntos,  :conditions => ["descricao like ? ", "%" + params[:search].to_s + "%"],:order => 'descricao ASC'
                render :update do |page|
                  page.replace_html 'livros', :partial => "livros"
                end
                else if params[:type_of].to_i == 5
                  @contador = Livro.all(:joins => :editora, :conditions => ["nome like ?", "%" + params[:search].to_s + "%"]).count
                  @livros = Livro.paginate :page => params[:page], :per_page => 50, :joins => :editora,  :conditions => ["nome like ? ", "%" + params[:search].to_s + "%"],:order => 'nome ASC'
                  render :update do |page|
                    page.replace_html 'livros', :partial => "livros"
                  end
                end
              end
            end
          end
      end
   end
end

  def filtrar    
    if params[:busca].present?
      @identificacoes = Identificacao.all(:conditions =>["livro like ?", params[:busca][:busca]+"%"])
    end
#      render :update do |page|
#        page.replace_html 'ident', :partial => "campos_identificacao"
#        page.replace_html 'aviso', :text => "Filtrado!"
#      end
      render :update do |page|
        page.replace_html 'lista_livros', :partial => "lista_livros"
      end
  end

  def return      
      session[:identificacao_id] = params[:selected]
      @identificacao = Identificacao.find(params[:selected])
      render :update do |page|
        page.replace_html 'identificacao', :text => @identificacao.livro
        page.replace_html 'subtitulo', :text => "<b>Subtitulo: </b>#{@identificacao.subtitulo}"
      end
  end


  def create_autor
    @autor = Autor.new(params[:autor])
    if @autor.save
      @autores = Autor.all
      @livro = Livro.new
      render :update do |page|
        page.replace_html 'autores', :partial => "shared/campos/campos_autor"
        page.replace_html 'aviso', :text => "AUTOR CADASTRADO, CONTINUE O CADASTRO. LEMBRE-SE DE SELECIONAR O AUTOR"
      end

    end
  end

  def create_assunto
    @assunto = Assunto.new(params[:assunto])
    if @assunto.save
      @assuntos = Assunto.all
      @livro = Livro.new
      render :update do |page|
        page.replace_html 'assuntos', :partial => "shared/campos/campos_assunto"
        page.replace_html 'aviso', :text => "ASSUNTO CADASTRADO, CONTINUE O CADASTRO. LEMBRE-SE DE SELECIONAR O ASSUNTO"
      end

    end
  end
  
  def create_local
    @localizacao = Localizacao.new(params[:localizacao])
    @localizacao.add_unidade(current_user.unidade_id)
    if @localizacao.save
      @localizacoes = Localizacao.all
      @livro = Livro.new
      render :update do |page|
        page.replace_html 'local', :partial => "shared/campos/campos_local"

        page.replace_html 'aviso', :text => "NOVA LOCALIZAÇÃO CADASTRADA, CONTINUE O CADASTRO"
      end

    end
  end


 def subtitulo
  session[:identificacao] = params[:livro_identificacao_id]
   #@identificacao = Identificacao.find(:all, :conditions => ["id=?", session[:identificacao]])
   @identificacao = Identificacao.find_by_id(session[:identificacao]).subtitulo
   #$teste = @identificacao.subtitulo
   render :partial => 'subtitulo'
 end

  protected

  def load_resources
    @assuntos = Assunto.all(:order => "descricao ASC")
    @identificacoes  = Identificacao.all(:order => 'livro ASC')
    @autores  = Autor.all(:order => "nome ASC")
    @areas = Area.all(:order => 'nome ASC')
    @editoras = Editora.all(:order => 'nome ASC')
    if current_user.unidade_id == 53
      @localizacoes = Localizacao.all(:include => :unidade,:order => 'local_guardado ASC')
    else
      @localizacoes = Localizacao.all(:include => :unidade, :conditions => ['unidade_id = ?', current_user.unidade_id], :order => 'local_guardado ASC')
    end
    

  end
end
