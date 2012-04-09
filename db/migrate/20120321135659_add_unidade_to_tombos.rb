class AddUnidadeToTombos < ActiveRecord::Migration
  def self.up
    add_column :tombos, :unidade_id, :integer
  end

  def self.down
    remove_column :tombos, :unidade_id
  end
end
