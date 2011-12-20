class DicionarioEnciclopediasController < ApplicationController

  before_filter :login_required
  before_filter :load_resources

 def consultaDic
   unless params[:search].present?
     if params[:type_of].to_i == 6
       @contador = DicionarioEnciclopedia.all.count
       @dicionario_enciclopedias = DicionarioEnciclopedia.paginate :all, :page => params[:page], :per_page => 10, :joins => :identificacao,:order => 'livro ASC'
       render :update do |page|
         page.replace_html 'dicionarios', :partial => "dicionarios"
       end
     end
   else
      if params[:type_of].to_i == 1
          @contador = DicionarioEnciclopedia.all(:joins => :identificacao, :conditions => ["livro like ?", "%" + params[:search].to_s + "%"]).count
          @dicionario_enciclopedias = DicionarioEnciclopedia.paginate :all, :page => params[:page], :per_page => 10,  :joins => :identificacao, :conditions => ["livro like ? and tipo =?", "%" + params[:search].to_s + "%","DICIONÁRIO"], :order => 'livro ASC'
          render :update do |page|
            page.replace_html 'dicionarios', :partial => "dicionarios"
          end
          else if params[:type_of].to_i == 2
          @contador = DicionarioEnciclopedia.all(:joins => :identificacao, :conditions => ["livro like ?", "%" + params[:search].to_s + "%"]).count
          @dicionario_enciclopedias = DicionarioEnciclopedia.paginate :all, :page => params[:page], :per_page => 10,  :joins => :identificacao, :conditions => ["livro like ? and tipo =?", "%" + params[:search].to_s + "%","ENCICLOPÉDIA"], :order => 'livro ASC'
            render :update do |page|
              page.replace_html 'dicionarios', :partial => "dicionarios"
            end
            else if params[:type_of].to_i == 3
              @contador = DicionarioEnciclopedia.all(:joins => :identificacao, :conditions => ["livro like ?", "%" + params[:search].to_s + "%"]).count
          @dicionario_enciclopedias = DicionarioEnciclopedia.paginate :all, :page => params[:page], :per_page => 10,  :joins => :identificacao, :conditions => ["livro like ? and tipo =?", "%" + params[:search].to_s + "%","OUTROS"], :order => 'livro ASC'
              render :update do |page|
                page.replace_html 'dicionarios', :partial => "dicionarios"
              end
              else if params[:type_of].to_i == 4
                @contador = DicionarioEnciclopedia.all(:joins => :assuntos, :conditions => ["descricao like ?", "%" + params[:search].to_s + "%"]).count
                @dicionario_enciclopedias = DicionarioEnciclopedia.paginate :all, :page => params[:page], :per_page => 10, :joins => :identificacao, :conditions => ["livro like ? and tipo =?", "%" + params[:search].to_s + "%","ENCICLOPÉDIA"], :order => 'livro ASC'
                render :update do |page|
                  page.replace_html 'dicionarios', :partial => "dicionarios"
                end
                else if params[:type_of].to_i == 5
                  @contador = DicionarioEnciclopedia.paginate.all(:joins => :editora, :conditions => ["nome like ?", "%" + params[:search].to_s + "%"]).count
                  @dicionario_enciclopedias = DicionarioEnciclopedia.paginate :all,  :page => params[:page], :per_page => 10,:joins => :identificacao, :conditions => ["livro like ? and tipo =?", "%" + params[:search].to_s + "%","ENCICLOPÉDIA"], :order => 'livro ASC'
                  render :update do |page|
                    page.replace_html 'dicionarios', :partial => "dicionarios"
                  end
                end
              end
            end
          end
      end
   end
end





  def index
    @dicionario_enciclopedias = DicionarioEnciclopedia.paginate :page => params[:page], :per_page => 10, :joins => :identificacao, :order => 'livro ASC'
  end

  def show
    @dicionario_enciclopedia = DicionarioEnciclopedia.find(params[:id])
  end

  def new
    @dicionario_enciclopedia = DicionarioEnciclopedia.new
  end

  def create
    @dicionario_enciclopedia = DicionarioEnciclopedia.new(params[:dicionario_enciclopedia])
    if @dicionario_enciclopedia.save
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @dicionario_enciclopedia
    else
      render :action => 'new'
    end
  end
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


def create_local
    @localizacao = Localizacao.new(params[:localizacao])
    @localizacao.add_unidade(current_user.unidade_id)
    y = @localizacao.data_aquisicao
    if @localizacao.save
      @localizacoes = Localizacao.all
      @dicionario_enciclopedia = DicionarioEnciclopedia.new
      render :update do |page|
        page.replace_html 'local', :partial => "shared/campos/campos_local"
        page.replace_html 'aviso', :text => "NOVO DICIONÁRIO & ENCICLOPÉDIA CADASTRADO, CONTINUE O CADASTRO"
      end

    end
  end


  

  def edit
    @dicionario_enciclopedia = DicionarioEnciclopedia.find(params[:id])
  end

  def update
    @dicionario_enciclopedia = DicionarioEnciclopedia.find(params[:id])
    if @dicionario_enciclopedia.update_attributes(params[:dicionario_enciclopedia])
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @dicionario_enciclopedia
    else
      render :action => 'edit'
    end
  end

  def destroy
    @dicionario_enciclopedia = DicionarioEnciclopedia.find(params[:id])
    @dicionario_enciclopedia.destroy
    flash[:notice] = "EXCLUIDO COM SUCESSO."
    redirect_to dicionario_enciclopedias_url
  end

 def subtitulo
  session[:identificacao] = params[:dicionario_enciclopedia_identificacao_id]
   @identificacao = Identificacao.find_by_id(session[:identificacao]).subtitulo
   render :partial => 'subtitulo'
   end


def filtrar
    if params[:busca].present?
      @identificacoes = Identificacao.all(:conditions =>["livro like ?", params[:busca][:busca]+"%"])
    end
      render :update do |page|
        page.replace_html 'lista_dicionarios', :partial => "lista_dicionarios"
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


    protected

  def load_resources
    @areas = Area.all(:order => 'nome ASC')
    @editoras = Editora.all(:order => 'nome ASC')
    @localizacoes = Localizacao.all(:order => 'local_guardado ASC')
    @identificacoes  = Identificacao.all(:order => 'livro ASC')
  end

end
