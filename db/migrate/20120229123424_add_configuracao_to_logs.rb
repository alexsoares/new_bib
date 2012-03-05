class AddConfiguracaoToLogs < ActiveRecord::Migration
  def self.up
    add_column :logs, :configuracao_id, :integer
  end

  def self.down
    remove_column :logs, :configuracao
  end
end
