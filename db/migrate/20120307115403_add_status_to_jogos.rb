class AddStatusToJogos < ActiveRecord::Migration
  def self.up
    add_column :jogos, :status, :boolean, :default => 1
  end

  def self.down
    remove_column :jogos, :status
  end
end
