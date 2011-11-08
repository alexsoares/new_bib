class CreateDicionarioEnciclopedias < ActiveRecord::Migration
  def self.up
    create_table :dicionario_enciclopedias do |t|
      t.references :editora
      t.references :area
      t.references :localizacao
      t.references :identificacao
      t.string :tombo_seduc
      t.string :tombo_l
      t.string :colecao
      t.string :tipo
      t.integer :volume
      t.date :data_edicao
      t.string :local_edicao
      t.text :obs
      t.timestamps
    end
  end

  def self.down
    drop_table :dicionario_enciclopedias
  end
end
