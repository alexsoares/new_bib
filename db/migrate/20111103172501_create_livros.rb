class CreateLivros < ActiveRecord::Migration
  def self.up
    create_table :livros do |t|
      t.references :identificacao
      #t.references :assunto
      t.references :area
      t.references :editora
      t.references :localizacao
      t.integer :tombo_seduc, :default => 0
      t.string :tombo_l
      t.string :colecao
      t.string :edicao
      t.date :data_edicao
      t.string :local_edicao
      t.text :resumo
      t.text :obs
      t.timestamps
    end
  end

  def self.down
    drop_table :livros
  end
end
