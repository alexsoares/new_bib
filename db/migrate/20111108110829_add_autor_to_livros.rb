class AddAutorToLivros < ActiveRecord::Migration
  def self.up
    add_column :livros, :autor, :integer
  end

  def self.down
    remove_column :livros, :autor
  end
end
