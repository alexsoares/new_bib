class AssuntosLivros < ActiveRecord::Migration
  def self.up
    create_table :assuntos_livros, :id => false do |t|
      t.references :assunto, :null => false
      t.references :livro, :null => false
    end

  end

  def self.down
    drop_table :assuntos_livros
  end
end
