class AreasController < ApplicationController
  def index
    @areas = Area.paginate :page => params[:page], :order => 'nome ASC', :per_page => 10
    
  end

  def show
    @area = Area.find(params[:id])
  end

  def new
    @area = Area.new
  end

  def create
    @area = Area.new(params[:area])
    if @area.save
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @area
    else
      render :action => 'new'
    end
  end

  def edit
    @area = Area.find(params[:id])
  end

  def update
    @area = Area.find(params[:id])
    if @area.update_attributes(params[:area])
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @area
    else
      render :action => 'edit'
    end
  end

  def destroy
    @area = Area.find(params[:id])
    @area.destroy
    flash[:notice] = "EXCLUIDO COM SUCESSO."
    redirect_to areas_url
  end

def consultaAre
 if (params[:search].nil? || params[:search].empty?)
   $t=01;
    @areas = Area.paginate :page => params[:page], :per_page => 10,  :conditions => ["nome like ? ", ""],:order => 'nome ASC'
 else
     $t=0;
    @areas = Area.paginate :page => params[:page], :per_page => 10, :conditions => ["nome like ?", "%" + params[:search].to_s + "%"],:order => 'nome ASC'

 end
end

end
