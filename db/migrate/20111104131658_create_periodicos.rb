class CreatePeriodicos < ActiveRecord::Migration
  def self.up
    create_table :periodicos do |t|
      t.references :localizacao
      t.string :tombo_seduc
      t.string :tombo_l
      t.string :tipo
      t.string :titulo
      t.string :subtitulo
      t.string :colecao
      t.string :producao
      t.string :periodicidade
      t.integer :issn
      t.string :local_producao
      t.date :data_producao
      t.string :obs
      t.timestamps
    end
  end

  def self.down
    drop_table :periodicos
  end
end
