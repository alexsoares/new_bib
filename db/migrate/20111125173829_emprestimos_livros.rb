class EmprestimosLivros < ActiveRecord::Migration
  def self.up
    create_table :emprestimos_livros, :id => false do |t|
      t.references :autor, :null => false
      t.references :livro, :null => false
    end
  end

  def self.down
    drop_table :emprestimos_livros
  end
end
