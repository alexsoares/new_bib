class ItensAssuntosController < ApplicationController
  def index
    @itens_assuntos = ItensAssunto.all
  end

  def show
    @itens_assunto = ItensAssunto.find(params[:id])
  end

  def new
    @itens_assunto = ItensAssunto.new
  end

  def create
    @itens_assunto = ItensAssunto.new(params[:itens_assunto])
    if @itens_assunto.save
      flash[:notice] = "Successfully created itens assunto."
      redirect_to @itens_assunto
    else
      render :action => 'new'
    end
  end

  def edit
    @itens_assunto = ItensAssunto.find(params[:id])
  end

  def update
    @itens_assunto = ItensAssunto.find(params[:id])
    if @itens_assunto.update_attributes(params[:itens_assunto])
      flash[:notice] = "Successfully updated itens assunto."
      redirect_to @itens_assunto
    else
      render :action => 'edit'
    end
  end

  def destroy
    @itens_assunto = ItensAssunto.find(params[:id])
    @itens_assunto.destroy
    flash[:notice] = "Successfully destroyed itens assunto."
    redirect_to itens_assuntos_url
  end
end
