class AddCamposToTombos < ActiveRecord::Migration
  def self.up
    add_column :tombos, :qtde_livro, :integer
  end

  def self.down
    remove_column :tombos, :qtde_livro
  end
end
