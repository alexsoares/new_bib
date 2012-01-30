class AddJogoToTombos < ActiveRecord::Migration
  def self.up
    add_column :tombos, :jogo_id, :integer
  end

  def self.down
    remove_column :tombos, :jogo_id
  end
end
