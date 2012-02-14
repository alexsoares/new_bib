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
    @emprestimo.unidade_id = current_user.unidade_id
    @emprestimo.dpu = params[:emprestimo]
    @emprestimo.data_emprestimo = Time.now
    if (session[:pessoa]).present?
      @emprestimo.aluno = session[:pessoa]
    end
    if @emprestimo.save
      flash[:notice] = "EMPRÉSTIMO REALIZADO COM SUCESSO."
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
      flash[:notice] = "EMPRESTIMO REALIZADO COM SUCESSO."
      redirect_to @emprestimo
    else
      render :action => 'edit'
    end
  end

  def destroy
    @emprestimo = Emprestimo.find(params[:id])
    @emprestimo.destroy
    flash[:notice] = "EXCLUIDO COM SUCESSO."
    redirect_to emprestimos_url
  end

  def tipo_para
    if params[:emprestimo_tipo_emprestimo].to_i == 0
      render :partial => "funcionario"
    else
      if params[:emprestimo_tipo_emprestimo].to_i == 1
        render :partial => "aluno"
      end
    end
  end
  
  def busca
    if params[:pessoa].present?
      if params[:pessoa][:nome].present?
       if current_user.unidade.unidades_gpd_id == 15
        @alunos = Aluno.all(:conditions => ["(classe_ano = ? or classe_ano is null) and (primeiro_nome(nome,1) = primeiro_nome(?,1))",session[:ano_letivo].to_i,params[:pessoa][:nome]])
       else
        @alunos = Aluno.all(:conditions => ["(classe_ano = ? or classe_ano is null) and (primeiro_nome(nome,1) = primeiro_nome(?,1)) and id_escola = ?",session[:ano_letivo].to_i,params[:pessoa][:nome], current_user.unidade.unidades_gpd_id])
       end
      else
       if current_user.unidade.unidades_gpd_id == 15
        @alunos = Aluno.all(:conditions => ["(classe_ano = ? or classe_ano is null)",session[:ano_letivo].to_i])
       else
        @alunos = Aluno.all(:conditions => ["(classe_ano = ? or classe_ano is null and id_escola = ?)",session[:ano_letivo].to_i, current_user.unidade.unidades_gpd_id])
       end        
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


  def retorno
      @pessoa = Aluno.find(params[:pessoa])
      session[:pessoa] = params[:pessoa]
      render :update do |page|
        page.replace_html 'aluno', :text => @pessoa.nome
      end
  end

    def retorno_livro
      session[:emprestimo] = params[:emprestimo]
      livro = Livro.find(params[:emprestimo])
      render :update do |page|
        page.replace_html 'livro', :text => livro.identificacao.livro
      end
  end



  def dpu
    id = Identificacao.all(:conditions => ["livro like ?",params[:livro][:dcu] + "%"], :select => "id")
    id_livro = Livro.all(:include => [:identificacao],:conditions => ["identificacao_id in (?) and status = 1",id])
    @disponiveis = Dpu.all(:include => [:livro], :conditions => ["livro_id in (?) and status = 1",id_livro])
    render :update do |page|
      page.replace_html 'livros', :partial => "livros_disponiveis"
    end
  end


protected
  def load_resources
    if current_user.unidade_id = 53
      @classes = Aluno.all(:select => "id_classe, classe_descricao, classe_ano, id_escola",:conditions => ["classe_ano = 2011"], :group => ["id_classe,classe_descricao, classe_ano,id_escola"] , :order => "classe_descricao")
    else
      @classes = Aluno.all(:select => "id_classe, classe_descricao, classe_ano, id_escola",:conditions => ["classe_ano = 2011 and id_escola = ?", current_user.unidade.unidades_gpd_id], :group => ["id_classe,classe_descricao, classe_ano,id_escola"] , :order => "classe_descricao")
    end
    if current_user.unidade_id = 53
      @funcionarios = Aluno.all(:conditions => ["matricula_funcionario is not null"])
    else
      @funcionarios = Aluno.all(:conditions => ["id_escola = ?", current_user.unidade.unidades_gpd_id])
    end
    @livros_disponiveis = Dpu.all(:include => [],:conditions => ["status = 1 and unidade_id = ?", 3], :limit => 10)
  end
end
