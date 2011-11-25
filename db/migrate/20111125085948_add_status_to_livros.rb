class AddStatusToLivros < ActiveRecord::Migration
  def self.up
    add_column :livros, :status, :boolean, :default => 1
  end

  def self.down
    remove_column :livros, :status
  end
end
