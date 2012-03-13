class AddStatusToMapas < ActiveRecord::Migration
  def self.up
    add_column :mapas, :status, :boolean,:default => 1
  end

  def self.down
    remove_column :mapas, :status
  end
end
