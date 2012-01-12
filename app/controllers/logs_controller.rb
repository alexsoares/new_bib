class LogsController < ApplicationController
  def index
    @logs = Log.all
  end

  def show
    @log = Log.find(params[:id])
  end

  def new
    @log = Log.new
  end

  def create
    @log = Log.new(params[:log])
    if @log.save
      flash[:notice] = "Successfully created log."
      redirect_to @log
    else
      render :action => 'new'
    end
  end

  def edit
    @log = Log.find(params[:id])
  end

  def update
    @log = Log.find(params[:id])
    if @log.update_attributes(params[:log])
      flash[:notice] = "Successfully updated log."
      redirect_to @log
    else
      render :action => 'edit'
    end
  end

  def destroy
    @log = Log.find(params[:id])
    @log.destroy
    flash[:notice] = "Successfully destroyed log."
    redirect_to logs_url
  end
end
