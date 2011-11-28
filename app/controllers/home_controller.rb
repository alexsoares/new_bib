class HomeController < ApplicationController
  before_filter :login_required
  def index
    @emprestimos = Emprestimo.all(:conditions => ["unidade_id = ?",current_user.unidade])
  end
end
