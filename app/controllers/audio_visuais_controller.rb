class AudioVisuaisController < ApplicationController
  before_filter :login_required
  before_filter :load_resources

  def index
   @audio_visuais = AudioVisual.paginate :page => params[:page], :per_page => 10, :order => 'titulo ASC'

  end

  def show
    @audio_visual = AudioVisual.find(params[:id])
  end

  def new
    @audio_visual = AudioVisual.new
  end

  def create
    @audio_visual = AudioVisual.new(params[:audio_visual])
    if @audio_visual.save
      flash[:notice] = "Successfully created audio visual."
      redirect_to @audio_visual
    else
      render :action => 'new'
    end
  end


  def edit
    @audio_visual = AudioVisual.find(params[:id])
  end

  def update
    @audio_visual = AudioVisual.find(params[:id])
    if @audio_visual.update_attributes(params[:audio_visual])
      flash[:notice] = "Successfully updated audio visual."
      redirect_to @audio_visual
    else
      render :action => 'edit'
    end
  end

  def destroy
    @audio_visual = AudioVisual.find(params[:id])
    @audio_visual.destroy
    flash[:notice] = "Successfully destroyed audio visual."
    redirect_to audio_visuais_url
  end


   def create_local
    @localizacao = Localizacao.new(params[:localizacao])
    @localizacao.add_unidade(current_user.unidade_id)
    if @localizacao.save
      @localizacoes = Localizacao.all
      @audio_visual = AudioVisual.new
      render :update do |page|
        page.replace_html 'local', :partial => "campos_local"
        page.replace_html 'aviso', :text => "NOVA LOCALIZAÇÃO CADASTRADA, CONTINUE O CADASTRO"
      end

    end
  end


 def musica1
  $var = params[:audio_visual_genero_id].to_i
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
      @audio_visual = AudioVisual.new
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
      @audio_visual = AudioVisual.new
      render :update do |page|
        page.replace_html 'musicas', :partial => "campos_musica"
        page.replace_html 'aviso', :text => "MÚSICA CADASTRADA, SELECIOINAR A MUSICA E CONTINUAR O CADASTRO"
      end

    end
  end

def consultaAud
   unless params[:search].present?
     if params[:type_of].to_i == 6
       @contador = AudioVisual.all.count
       @audio_visuais = AudioVisual.paginate :all, :page => params[:page], :per_page => 10,:order => 'titulo ASC'
       render :update do |page|
         page.replace_html 'audio_visuais', :partial => "audio_visuais"
       end
     end
   else
      if params[:type_of].to_i == 1
         @contador = AudioVisual.all(:conditions => ["titulo like ?", "%" + params[:search].to_s + "%"]).count
         @audio_visuais = AudioVisual.paginate :all, :page => params[:page], :per_page => 10, :conditions => ["titulo like ? ", "%" + params[:search].to_s + "%"],:order => 'titulo ASC'
          render :update do |page|
            page.replace_html 'audio_visuais', :partial => "audio_visuais"
          end
          else if params[:type_of].to_i == 2
            @contador = AudioVisual.all(:joins => :genero, :conditions => ["nome like ?", "%" + params[:search].to_s + "%"]).count
            @audio_visuais = AudioVisual.paginate :all, :page => params[:page], :per_page => 10, :joins => :genero,  :conditions => ["nome like ? ", "%" + params[:search].to_s + "%"],:order => 'nome ASC'
            render :update do |page|
              page.replace_html 'audio_visuais', :partial => "audio_visuais"
            end
            else if params[:type_of].to_i == 3
              @contador = AudioVisual.all(:joins => :musicas, :conditions => ["nome like ?", "%" + params[:search].to_s + "%"]).count
              @audio_visuais = AudioVisual.paginate :all, :page => params[:page], :per_page => 10, :joins => :musicas,  :conditions => ["nome like ? ","%" + params[:search].to_s + "%"],:order => 'nome ASC'
              render :update do |page|
                page.replace_html 'audio_visuais', :partial => "audio_visuais_mus"
              end
              else if params[:type_of].to_i == 4
                @contador = AudioVisual.all(:joins => :cantores, :conditions => ["nome like ?", "%" + params[:search].to_s + "%"]).count
                @audio_visuais = AudioVisual.paginate :page => params[:page], :per_page => 10, :joins => :cantores,  :conditions => ["nome like ? ", "%" + params[:search].to_s + "%"],:order => 'nome ASC'
                render :update do |page|
                  page.replace_html 'audio_visuais', :partial => "audio_visuais_can"
                end
                else if params[:type_of].to_i == 5
                  @contador = AudioVisual.all(:joins => :editora, :conditions => ["nome like ?", "%" + params[:search].to_s + "%"]).count
                  @audio_visuais = AudioVisual.paginate :page => params[:page], :per_page => 10, :joins => :editora,  :conditions => ["nome like ? ", "%" + params[:search].to_s + "%"],:order => 'nome ASC'
                  render :update do |page|
                    page.replace_html 'audio_visuais', :partial => "audio_visuais"
                  end
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

    @localizacoes = Localizacao.all(:conditions => ['unidade_id = ?', current_user.unidade_id])
end

end
