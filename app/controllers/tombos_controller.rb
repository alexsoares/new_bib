class TombosController < ApplicationController
  before_filter :load_resources
  def index
    @tombos = Tombo.all.count    
  end

  def select_user
    @no_livros_per_user = Tombo.find_all_by_user_id(params[:tombo][:user], :include => [:user,:livro], :conditions => ["livro_id not in (select id from livros)"])
    @livros_per_user = Tombo.find_all_by_user_id(params[:tombo][:user], :include => [:user,:livro], :conditions => ["livro_id in (select id from livros)"])
    render :update do |page|
      page.replace_html 'livro_per_user', :partial => "per_user"
      page.replace_html 'count', :text => "Total cadastrado: #{@livros_per_user.count + @no_livros_per_user.count} - #{@no_livros_per_user.count} = #{@livros_per_user.count} livros"
    end
  end

  protected

  def load_resources
    @users = User.all
  end
end
