class EditorasController < ApplicationController

  before_filter :load_resources

  def index
    @editoras = Editora.paginate :page => params[:page], :order => 'nome ASC', :per_page => 10

  end

  def show
    @editora = Editora.find(params[:id])
  end

  def new
    @editora = Editora.new
  end

  def create
    @editora = Editora.new(params[:editora])
    if @editora.save
      flash[:notice] = "CASTRADO COM SUCESSO."
      redirect_to @editora
    else
      render :action => 'new'
    end
  end

  def edit
    @editora = Editora.find(params[:id])
  end

  def update
    @editora = Editora.find(params[:id])
    if @editora.update_attributes(params[:editora])
      flash[:notice] = "CASTRADO COM SUCESSO."
      redirect_to @editora
    else
      render :action => 'edit'
    end
  end

  def destroy
    @editora = Editora.find(params[:id])
    @editora.destroy
    flash[:notice] = "EXCLUIDO COM SUCESSO."
    redirect_to editoras_url
  end

def consultaEdi
  unless params[:search].present?
    if params[:type_of].to_i == 3
      @contador = Editora.all.count
      @editoras = Editora.paginate :all,:page => params[:page], :order => 'nome ASC', :per_page => 10
      render :update do |page|
        page.replace_html 'editoras', :partial => "editoras"
      end
    end
  else
    if params[:type_of].to_i == 1
      @contador = Editora.all(:conditions => ["nome like ?", "%" + params[:search].to_s + "%"]).count
      @editoras = Editora.paginate :all, :page => params[:page], :per_page => 10, :conditions => ["nome like ?", "%" + params[:search].to_s + "%"],:order => 'nome ASC'
      render :update do |page|
        page.replace_html 'editoras', :partial => "editoras"
      end
    end
  end
end

def consulta_editora_livro
       session[:editora] = params[:editora_id]
       @editoras = Editora.find(session[:editora])
       render :update do |page|
         page.replace_html 'dadoseditoras', :partial => "editoras_livro"
      end
  end


protected

  def load_resources
        @editoras= Editora.all(:order => 'nome ASC')
  end


end
