class Log < ActiveRecord::Base
  belongs_to :configuracao
  belongs_to :user

  def self.gera_log(acao,area,usuario,find_id)
    log = Log.new
    log.acao = acao.to_s
    log.area = area.to_s
    log.user_id = usuario
    log.find_id = find_id
    log.save
  end
  
end
