class AudioVisuaisController < ApplicationController
  before_filter :login_required
  before_filter :load_resources

  def index
   @audio_visuais = AudioVisual.paginate :page => params[:page], :per_page => 10, :joins => :identificacao, :order => 'titulo ASC'

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

  protected

  def load_resources
    @musicas= Musica.all(:order => 'nome ASC')
    @generos= Genero.all(:order => 'nome ASC')
    @localizacoes = Localizacao.all(:conditions => ['unidade_id = ?', current_user.unidade_id])
end

end
