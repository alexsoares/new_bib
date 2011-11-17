class AutenticacaoDatabase < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "autenticacao_#{RAILS_ENV}"
end