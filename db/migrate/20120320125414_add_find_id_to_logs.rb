class AddFindIdToLogs < ActiveRecord::Migration
  def self.up
    add_column :logs, :find_id, :integer
  end

  def self.down
    remove_column :logs, :find_id
  end
end
