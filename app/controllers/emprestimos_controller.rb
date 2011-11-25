class EmprestimosController < ApplicationController
  before_filter :load_resources
  def index
    @emprestimos = Emprestimo.all
  end

  def show
    @emprestimo = Emprestimo.find(params[:id])
  end

  def new
    @emprestimo = Emprestimo.new
  end

  def create
    @emprestimo = Emprestimo.new(params[:emprestimo])
    if @emprestimo.save
      flash[:notice] = "Successfully created emprestimo."
      redirect_to @emprestimo
    else
      render :action => 'new'
    end
  end

  def edit
    @emprestimo = Emprestimo.find(params[:id])
  end

  def update
    @emprestimo = Emprestimo.find(params[:id])
    if @emprestimo.update_attributes(params[:emprestimo])
      flash[:notice] = "Successfully updated emprestimo."
      redirect_to @emprestimo
    else
      render :action => 'edit'
    end
  end

  def destroy
    @emprestimo = Emprestimo.find(params[:id])
    @emprestimo.destroy
    flash[:notice] = "Successfully destroyed emprestimo."
    redirect_to emprestimos_url
  end

  def tipo_para
    if params[:emprestimo_tipo_emprestimo].to_i == 1
      render :partial => "funcionario"
    else
      render :partial => "aluno"
    end
  end
  def busca
    if params[:pessoa].present?
      if params[:pessoa][:nome].present?
        @alunos = Aluno.all(:conditions => ["(classe_ano = ? or classe_ano is null) and (primeiro_nome(nome,1) = primeiro_nome(?,1))",session[:ano_letivo].to_i,params[:pessoa][:nome]])
      else
        @alunos = Aluno.all(:conditions => ["(classe_ano = ? or classe_ano is null)",session[:ano_letivo].to_i])
      end
          #@alunos = Aluno.all(:conditions => ["(classe_ano = 2011 or classe_ano is null) and (primeiro_nome(nome,1) = primeiro_nome('JOAO',1) and pes_dtnasc = '2002-01-06')",])
          render :update do |page|
            page.replace_html 'pessoas', :partial => "pessoas"
          end

      end

  end
  def classe
    session[:classe] = params[:classe][:id_classe]
    session[:ano_letivo] = params[:classe][:ano_letivo]
    if params[:classe].present?
          render :update do |page|
            page.replace_html 'classe', :partial => "listagem"
          end
    end
  end

protected
  def load_resources
    @classes = Aluno.all(:select => "id_classe, classe_descricao, classe_ano, id_escola",:conditions => ["classe_ano = 2011 and id_escola = ?", current_user.unidade.unidades_gpd_id], :group => ["id_classe,classe_descricao, classe_ano,id_escola"] , :order => "classe_descricao")
    @funcionarios = Funcionario.all(:conditions => ["unidade_id = ?", current_user.unidade_id])
  end
end
