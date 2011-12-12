class CantoresController < ApplicationController
  # GET /cantores
  # GET /cantores.xml
  def index
    @cantores = Cantor.paginate :page => params[:page], :order => 'nome ASC', :per_page => 10
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cantores }
    end
  end

  # GET /cantores/1
  # GET /cantores/1.xml
  def show
    @cantor = Cantor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cantor }
    end
  end

  # GET /cantores/new
  # GET /cantores/new.xml
  def new
    @cantor = Cantor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cantor }
    end
  end

  # GET /cantores/1/edit
  def edit
    @cantor = Cantor.find(params[:id])
  end

  # POST /cantores
  # POST /cantores.xml
  def create
    @cantor = Cantor.new(params[:cantor])

    respond_to do |format|
      if @cantor.save
        flash[:notice] = 'Cantor was successfully created.'
        format.html { redirect_to(@cantor) }
        format.xml  { render :xml => @cantor, :status => :created, :location => @cantor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cantor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cantores/1
  # PUT /cantores/1.xml
  def update
    @cantor = Cantor.find(params[:id])

    respond_to do |format|
      if @cantor.update_attributes(params[:cantor])
        flash[:notice] = 'Cantor was successfully updated.'
        format.html { redirect_to(@cantor) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cantor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cantores/1
  # DELETE /cantores/1.xml
  def destroy
    @cantor = Cantor.find(params[:id])
    @cantor.destroy

    respond_to do |format|
      format.html { redirect_to(cantores_url) }
      format.xml  { head :ok }
    end
  end

def consultaCan
 if (params[:search].nil? || params[:search].empty?)
   $t=01;
    @cantores = Cantor.paginate :page => params[:page], :per_page => 10,  :conditions => ["nome like ? ", ""],:order => 'nome ASC'
 else
     $t=0;
    @cantores = Cantor.paginate :page => params[:page], :per_page => 10, :conditions => ["nome like ?", "%" + params[:search].to_s + "%"],:order => 'nome ASC'

 end
end

end
