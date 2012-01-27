class AddMidiaToTombos < ActiveRecord::Migration
  def self.up
    add_column :tombos, :midia_id, :integer
  end

  def self.down
    remove_column :tombos, :midia_id
  end
end
