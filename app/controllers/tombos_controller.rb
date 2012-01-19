class TombosController < ApplicationController
  before_filter :load_resources
  def index
    @tombos = Tombo.all.count
    @no_tombos = Tombo.all(:conditions => ["livro_id not in (select id from livros)"]).count
  end

  def diarios
    render :layout => "default"
    atual_inicio = Date.today + 0.hours - 6.days
    anterior_inicio = atual_inicio - 1.day
    @atual = Tombo.all(:conditions => ["created_at between ? and ?", atual_inicio,(atual_inicio + 23.hours + 59.minutes)])
    @anterior = Tombo.all(:conditions => ["created_at between ? and ?", anterior_inicio,(anterior_inicio + 23.hours + 59.minutes)])
  end

  def usuario
    render :layout => "default"
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
