class MidiasController < ApplicationController

  before_filter :login_required
  before_filter :load_resources


  # GET /midias
  # GET /midias.xml
  def index
    @midias = Midia.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @midias }
    end
  end

  # GET /midias/1
  # GET /midias/1.xml
  def show
    @midia = Midia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @midia }
    end
  end

  # GET /midias/new
  # GET /midias/new.xml
  def new
    @midia = Midia.new

    end


  # GET /midias/1/edit
  def edit
    @midia = Midia.find(params[:id])
    @musicas_selecionados = @midia.musicas
    @musicas =  @musicas - @musicas_selecionados


  end


  def create
    qtd = params[:midia][:qtde_midias].to_i
    if qtd == 0
      qtd = 1
    end
    tombos = params[:midia][:lista_tombos].split(";")
      i = 0
      qtd.times do
        @midia = Midia.new(params[:midia])
        @midia.usuario = current_user.id
        @midia.unidade = current_user.unidade_id

        if params[:midia][:qtde_midias].to_i == 0
          @midia.qtde_midias = 1
        else
          @midia.qtde_midias = params[:midia][:qtde_midias].to_i
        end

        @midia.tombo_l = tombos[i]
        #@livros_cad << @livro.tombo_l
        if qtd == 1
          if @midia.save
              flash[:notice] = "Successfully created audio visual."
              redirect_to @midia
            else
              render :action => 'new'
          end
        else
          @midia.save
        end
        i += 1
      end
      if qtd == 1
      else
        redirect_to midias_cadastradas_midias_path
      end
      #render :action => 'livros_cadastrados', :collection => @livros_cad
  end



#  def create
#    @midia = Midia.new(params[:midia])
#    if @midia.save
#      flash[:notice] = "Successfully created audio visual."
#      redirect_to @midia
#    else
#      render :action => 'new'
#    end
#  end
  def midias_cadastradas
    limit = Tombo.last(:conditions => ["user_id = ? and midia_id is not null", current_user])
    @midias_cad = Tombo.all(:conditions => ["user_id = ? and midia_id is not null", current_user], :limit => limit.qtde_livro, :order => "id DESC")
  end


  # PUT /midias/1
  # PUT /midias/1.xml
  def update
    @midia = Midia.find(params[:id])

    respond_to do |format|
      if @midia.update_attributes(params[:midia])
        flash[:notice] = 'Midia was successfully updated.'
        format.html { redirect_to(@midia) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @midia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /midias/1
  # DELETE /midias/1.xml
  def destroy
    @midia = Midia.find(params[:id])
    @midia.destroy

    respond_to do |format|
      format.html { redirect_to(midias_url) }
      format.xml  { head :ok }
    end
  end


   def create_local
    @localizacao = Localizacao.new(params[:localizacao])
    @localizacao.add_unidade(current_user.unidade_id)
    if @localizacao.save
      @localizacoes = Localizacao.all(:conditions => ["unidade_id = ?",current_user.unidade_id])
      @midia = Midia.new
      render :update do |page|
        page.replace_html 'local', :partial => "shared/campos/campos_local"
        page.replace_html 'aviso', :text => "NOVA LOCALIZAÇÃO CADASTRADA, CONTINUE O CADASTRO"
      end

    end
  end


   def create_cantor
    @cantor = Cantor.new(params[:cantor])
    if @cantor.save
      @cantores = Cantor.all
      @midia = Midia.new
      render :update do |page|
        page.replace_html 'cantores', :partial => "shared/campos/campos_cantor"
        page.replace_html 'aviso', :text => "CANTOR CADASTRADO, CONTINUE O CADASTRO. LEMBRE-SE DE SELECIONAR O AUTOR"
      end

    end
  end
   def create_musica
    @musica = Musica.new(params[:musica])
    if @musica.save
      @musicas = Musica.all
      @midia = Midia.new
      render :update do |page|
        page.replace_html 'musica', :partial => "shared/campos/campos_musica"
        page.replace_html 'aviso', :text => "MÚSICA CADASTRADA, SELECIOINAR A MUSICA E CONTINUAR O CADASTRO"
      end

    end
  end


 def consultaMid
   unless params[:search].present?
     if params[:type_of].to_i == 6
       @contador = Midia.all(:include =>[:localizacao],:conditions =>["localizacoes.unidade_id = ?",current_user.unidade_id]).count
       @midias = Midia.paginate(:all,:include =>[:localizacao],:conditions =>["localizacoes.unidade_id = ?",current_user.unidade_id], :page => params[:page], :per_page => 10,:order => 'titulo ASC')
       render :update do |page|
         page.replace_html 'midias', :partial => "midias"
       end
     end
   else
      if params[:type_of].to_i == 1
          @contador = Midia.all(:include =>[:localizacao],:conditions =>  ["titulo like ? and tipo = ? and localizacoes.unidade_id = ?", "%" + params[:search].to_s + "%","CD",current_user.unidade_id]).count
          @midias = Midia.paginate(:all, :include => [:localizacao], :page => params[:page], :per_page => 10, :conditions => ["titulo like ? and tipo = ? and localizacoes.unidade_id = ?", "%" + params[:search].to_s + "%","CD",current_user.unidade_id], :order => 'titulo ASC')
          render :update do |page|
            page.replace_html 'midias', :partial => "midias"
          end
          else if params[:type_of].to_i == 2
          @contador = Midia.all(:include => [:localizacao],:conditions => ["titulo like ? and tipo = ? and localizacoes.unidade_id = ?", "%" + params[:search].to_s + "%","DVD",current_user.unidade_id]).count
          @midias = Midia.paginate(:all, :include =>[:localizacao], :page => params[:page], :per_page => 10,:conditions => ["titulo like ? and tipo = ? and localizacoes.unidade_id = ?", "%" + params[:search].to_s + "%","DVD",current_user.unidade_id], :order => 'titulo ASC')
            render :update do |page|
              page.replace_html 'midias', :partial => "midias"
            end
            else if params[:type_of].to_i == 3
              @contador = Midia.all(:include =>[:localizacao],:conditions => ["titulo like ? and tipo = ? and localizacoes.unidade_id = ?", "%" + params[:search].to_s + "%","VHS",current_user.unidade_id]).count
              @midias = Midia.paginate(:all, :include => [:localizacao], :page => params[:page], :per_page => 10,:conditions => ["titulo like ? and tipo = ? and localizacoes.unidade_id = ?", "%" + params[:search].to_s + "%","VHS",current_user.unidade_id], :order => 'titulo ASC')
              render :update do |page|
                page.replace_html 'midias', :partial => "midias"
              end
              else if params[:type_of].to_i == 4
               @contador = Midia.all(:include => [:localizacao],:conditions => ["titulo like ? and tipo = ? localizacoes.unidade_id = ?", "%" + params[:search].to_s + "%","OUTROS",current_user.unidade_id]).count
               @midias = Midia.paginate(:all,:include => [:localizacao], :page => params[:page], :per_page => 10,:conditions => ["titulo like ? and tipo = ? and localizacoes.unidade_id = ?", "%" + params[:search].to_s + "%","OUTROS",current_user.unidade_id], :order => 'titulo ASC')
                render :update do |page|
                  page.replace_html 'midias', :partial => "midias"
                end
              end
            end
          end
      end
   end
end


protected

  def load_resources
    @cantores= Cantor.all(:order => 'nome ASC')
    @musicas= Musica.all(:order => 'nome ASC')
    @generos= Genero.all(:order => 'nome ASC')
    if current_user.unidade_id == 53
      @localizacoes = Localizacao.all(:order => 'local_guardado ASC')
    else
      @localizacoes = Localizacao.all(:conditions => ['unidade_id = ?', current_user.unidade_id], :order => 'local_guardado ASC')
    end

end

end
