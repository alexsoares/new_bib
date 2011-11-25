class CreateAutoresLivros < ActiveRecord::Migration
  def self.up
    create_table :autores_livros, :id => false do |t|
      t.references :autor, :null => false
      t.references :livro, :null => false
    end
  end

  def self.down
    drop_table :autores_livros
  end
end
