class AddDicionarioToTombos < ActiveRecord::Migration
  def self.up
    add_column :tombos, :dicionario_enciclopedia_id, :integer
  end

  def self.down
    remove_column :tombos, :dicionario_enciclopedia_id
  end
end
