class AddUnidadeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :unidade_id, :integer
  end

  def self.down
    remove_column :users, :unidade_id
  end
end
