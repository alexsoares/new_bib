class TombosController < ApplicationController
  before_filter :load_resources
  def index
    @tombos = Tombo.all.count    
  end

  def select_user
    @livros_per_user = Tombo.find_all_by_user_id(params[:tombo][:user], :include => [:user,:livro])
    render :update do |page|
      page.replace_html 'livro_per_user', :partial => "per_user"
      page.replace_html 'count', :text => "Total cadastrado: #{@livros_per_user.count} livros"
    end
  end

  protected

  def load_resources
    @users = User.all
  end
end
