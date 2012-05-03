class HomeController < ApplicationController
  before_filter :login_required
  def index
    @emprestimos = Emprestimo.paginate(:all,:conditions => ["unidade_id = ?",current_user.unidade], :per_page => 15, :page => params[:page], :order => "id Desc")
  end
end
