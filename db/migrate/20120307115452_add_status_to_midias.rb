class AddStatusToMidias < ActiveRecord::Migration
  def self.up
    add_column :midias, :status, :boolean, :default => 1
  end

  def self.down
    remove_column :midias, :status
  end
end
