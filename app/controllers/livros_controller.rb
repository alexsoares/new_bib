class LivrosController < ApplicationController
  before_filter :login_required
  before_filter :load_resources

    def create_editora
      
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

      @livro = Identificacao.all :order => 'livro ASC'
      @livros = Livro.paginate :all, :page => params[:page], :per_page => 10

    @livro_hash = []
    @livro.each do |id|
      @livro_hash <<  id.livro
    end

    respond_to do |format|
      format.html
      format.js
      format.json  { render :json => @livro_hash }
    end

  end

  def show
    @livro = Livro.find(params[:id])
  end

  def new
    @livro = Livro.new
  end

  def create
    @livro = Livro.new(params[:livro])
    @livro.identificacao_id = session[:identificacao_id]
    session[:identificacao_id] = nil

    if @livro.save
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @livro
    else
      render :action => 'new'
    end
  end

  def edit
    @livro = Livro.find(params[:id])
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
       @livros = Livro.paginate :all, :page => params[:page], :per_page => 10, :joins => :identificacao,:order => 'livro ASC'
       render :update do |page|
         page.replace_html 'livros', :partial => "livros"
       end
     end
   else
      if params[:type_of].to_i == 1
          @livros = Livro.paginate :all, :page => params[:page], :per_page => 10, :joins => :identificacao,  :conditions => ["livro like ? ", "%" + params[:search].to_s + "%"],:order => 'livro ASC'
          render :update do |page|
            page.replace_html 'livros', :partial => "livros"
          end
          else if params[:type_of].to_i == 2
            @livros = Livro.paginate :all, :page => params[:page], :per_page => 10, :joins => :area,  :conditions => ["nome like ? ", "%" + params[:search].to_s + "%"],:order => 'nome ASC'
            render :update do |page|
              page.replace_html 'livros', :partial => "livros"
            end
            else if params[:type_of].to_i == 3
              @livros = Livro.paginate :all, :page => params[:page], :per_page => 10, :joins => :autores,  :conditions => ["nome like ? ", "%" + params[:search].to_s + "%"],:order => 'nome ASC'
              render :update do |page|
                page.replace_html 'livros', :partial => "livros"
              end
              else if params[:type_of].to_i == 4
                @livros = Livro.paginate :page => params[:page], :per_page => 10, :joins => :assuntos,  :conditions => ["descricao like ? ", "%" + params[:search].to_s + "%"],:order => 'descricao ASC'
                render :update do |page|
                  page.replace_html 'livros', :partial => "livros"
                end
                else if params[:type_of].to_i == 5
                @livros = Livro.paginate :page => params[:page], :per_page => 10, :joins => :editora,  :conditions => ["nome like ? ", "%" + params[:search].to_s + "%"],:order => 'nome ASC'
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
        page.replace_html 'autores', :partial => "campos_autor"
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
        page.replace_html 'assuntos', :partial => "campos_assunto"
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
        page.replace_html 'local', :partial => "campos_local"
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
      @localizacoes = Localizacao.all(:order => 'local_guardado ASC')
    else
      @localizacoes = Localizacao.all(:conditions => ['unidade_id = ?', current_user.unidade_id], :order => 'local_guardado ASC')
    end
    

  end
end
