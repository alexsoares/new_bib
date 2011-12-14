class IdentificacaosController < ApplicationController
  def index
    @identificacaos = Identificacao.paginate :page => params[:page], :order => 'livro ASC', :per_page => 10
   
  end

  def show
    @identificacao = Identificacao.find(params[:id])
  end

  def new
    @identificacao = Identificacao.new
  end

  def create
    @identificacao = Identificacao.new(params[:identificacao])
    if @identificacao.save
      flash[:notice] = "CASTRADO COM SUCESSO."
      redirect_to @identificacao
    else
      render :action => 'new'
    end
  end

  def edit
    @identificacao = Identificacao.find(params[:id])
  end

  def update
    @identificacao = Identificacao.find(params[:id])
    if @identificacao.update_attributes(params[:identificacao])
      flash[:notice] = "CASTRADO COM SUCESSO."
      redirect_to @identificacao
    else
      render :action => 'edit'
    end
  end

  def destroy
    @identificacao = Identificacao.find(params[:id])
    @identificacao.destroy
    flash[:notice] = "EXCLUIDO COM SUCESSO."
    redirect_to identificacaos_url
  end

def consultaTit
 if (params[:search].nil? || params[:search].empty?)
   $t=01;
    @contador = Identificacao.find(:all, :conditions => ["livro like ?", "%" + params[:search].to_s + "%"], :order => 'livro ASC')
    @identificacaos = Identificacao.paginate :page => params[:page], :per_page => 10,  :conditions => ["livro like ? ", ""],:order => 'livro ASC'
 else if params[:type_of].to_i == 1
     $t=0;
      @contador = Identificacao.find(:all, :conditions => ["livro like ?", "%" + params[:search].to_s + "%"], :order => 'livro ASC')
      @identificacaos = Identificacao.paginate :page => params[:page], :per_page => 10, :conditions => ["livro like ?", "%" + params[:search].to_s + "%"],:order => 'livro ASC'
     else if params[:type_of].to_i == 2
        $t=0;
        @contador = Identificacao.find(:all, :conditions => ["livro like ?", "%" + params[:search].to_s + "%"], :order => 'livro ASC')
        @identificacaos = Identificacao.paginate :page => params[:page], :per_page => 10, :conditions => ["subtitulo like ?", "%" + params[:search].to_s + "%"],:order => 'livro ASC'
      else
        @contador = Identificacao.find(:all, :conditions => ["livro like ?", "%" + params[:search].to_s + "%"], :order => 'livro ASC')
        @identificacaos = Identificacao.paginate :page => params[:page], :order => 'livro ASC', :per_page => 10
     end
    end
  end
end

end
