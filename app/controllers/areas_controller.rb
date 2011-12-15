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
  unless params[:search].present?
    if params[:type_of].to_i == 3
      @contador = Area.all.count
      @areas = Area.paginate :all,:page => params[:page], :order => 'nome ASC', :per_page => 10
      render :update do |page|
        page.replace_html 'areas', :partial => "areas"
      end
    end
  else
    if params[:type_of].to_i == 1
      @contador = Area.all(:conditions => ["nome like ?", "%" + params[:search].to_s + "%"]).count
      @areas = Area.paginate :all, :page => params[:page], :per_page => 10, :conditions => ["nome like ?", "%" + params[:search].to_s + "%"],:order => 'nome ASC'
      render :update do |page|
        page.replace_html 'areas', :partial => "areas"
      end
      else if params[:type_of].to_i == 2
        @contador = Area.all(:conditions => ["nome like ?", "%" + params[:search].to_s + "%"]).count
        @areas = Area.paginate :all, :page => params[:page], :per_page => 10, :conditions => ["nome like ?", "%" + params[:search].to_s + "%"],:order => 'nome ASC'
        render :update do |page|
           page.replace_html 'areas', :partial => "areas"
         end
      end
    end
  end
end

end
