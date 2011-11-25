class CreateItensEmprestimos < ActiveRecord::Migration
  def self.up
    create_table :itens_emprestimos do |t|
      t.references :emprestimo
      t.references :audio_visual
      t.references :livro
      t.references :dicionario_enciclopedia
      t.references :mapas
      t.references :periodico
      t.references :jogo
      t.timestamps
    end
  end

  def self.down
    drop_table :itens_emprestimos
  end
end
