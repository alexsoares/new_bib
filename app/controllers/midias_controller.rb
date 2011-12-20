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
  end


  def create
    @midia = Midia.new(params[:midia])
    if @midia.save
      flash[:notice] = "Successfully created audio visual."
      redirect_to @midia
    else
      render :action => 'new'
    end
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
      @localizacoes = Localizacao.all
      @midia = Midia.new
      render :update do |page|
        page.replace_html 'local', :partial => "campos_local"
        page.replace_html 'aviso', :text => "NOVA LOCALIZAÇÃO CADASTRADA, CONTINUE O CADASTRO"
      end

    end
  end


 def musica1
  $var = params[:midia_genero_id].to_i
   if ($var== 17)
    render :update do |page|
        page.replace_html "musica", :partial=> "musica"
    end
   else
     render :nothing => true
   end
 end

   def create_cantor
    @cantor = Cantor.new(params[:cantor])
    if @cantor.save
      @cantores = Cantor.all
      @midia = Midia.new
      render :update do |page|
        page.replace_html 'cantores', :partial => "campos_cantor"
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
        page.replace_html 'musicas', :partial => "campos_musica"
        page.replace_html 'aviso', :text => "MÚSICA CADASTRADA, SELECIOINAR A MUSICA E CONTINUAR O CADASTRO"
      end

    end
  end

protected

  def load_resources
    @cantores= Cantor.all(:order => 'nome ASC')
    @musicas= Musica.all(:order => 'nome ASC')
    @generos= Genero.all(:order => 'nome ASC')
    @localizacoes = Localizacao.all(:conditions => ['unidade_id = ?', current_user.unidade_id])
end

end
