class AddStatusToPeriodicos < ActiveRecord::Migration
  def self.up
    add_column :periodicos, :status, :boolean,:default => 1
  end

  def self.down
    remove_column :periodicos, :status
  end
end
