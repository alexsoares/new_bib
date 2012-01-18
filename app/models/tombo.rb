class Tombo < ActiveRecord::Base
  belongs_to :livro
  belongs_to :user
end
