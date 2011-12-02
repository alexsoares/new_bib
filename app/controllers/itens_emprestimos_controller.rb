class ItensEmprestimosController < ApplicationController
  def index
    @itens_emprestimos = ItensEmprestimo.all
  end

  def show
    @itens_emprestimo = ItensEmprestimo.find(params[:id])
  end

  def new
    @itens_emprestimo = ItensEmprestimo.new
  end

  def create
    @itens_emprestimo = ItensEmprestimo.new(params[:itens_emprestimo])
    if @itens_emprestimo.save
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @itens_emprestimo
    else
      render :action => 'new'
    end
  end

  def edit
    @itens_emprestimo = ItensEmprestimo.find(params[:id])
  end

  def update
    @itens_emprestimo = ItensEmprestimo.find(params[:id])
    if @itens_emprestimo.update_attributes(params[:itens_emprestimo])
      flash[:notice] = "CADASTRADO COM SUCESSO."
      redirect_to @itens_emprestimo
    else
      render :action => 'edit'
    end
  end

  def destroy
    @itens_emprestimo = ItensEmprestimo.find(params[:id])
    @itens_emprestimo.destroy
    flash[:notice] = "EXCLUIDO COM SUCESSO."
    redirect_to itens_emprestimos_url
  end
end
