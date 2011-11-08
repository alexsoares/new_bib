class AssuntosController < ApplicationController
  def index
    @assuntos = Assunto.all
  end

  def show
    @assunto = Assunto.find(params[:id])
  end

  def new
    @assunto = Assunto.new
  end

  def create
    @assunto = Assunto.new(params[:assunto])
    if @assunto.save
      flash[:notice] = "Successfully created assunto."
      redirect_to @assunto
    else
      render :action => 'new'
    end
  end

  def edit
    @assunto = Assunto.find(params[:id])
  end

  def update
    @assunto = Assunto.find(params[:id])
    if @assunto.update_attributes(params[:assunto])
      flash[:notice] = "Successfully updated assunto."
      redirect_to @assunto
    else
      render :action => 'edit'
    end
  end

  def destroy
    @assunto = Assunto.find(params[:id])
    @assunto.destroy
    flash[:notice] = "Successfully destroyed assunto."
    redirect_to assuntos_url
  end
end
