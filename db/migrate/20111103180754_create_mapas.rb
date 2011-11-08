class CreateMapas < ActiveRecord::Migration
  def self.up
    create_table :mapas do |t|
      t.references :editora
      t.references :localizacao
      t.string :tombo_seduc
      t.string :tombo_l
      t.string :tipo
      t.string :subtitulo
      t.date :ano
      t.string :formato
      t.date :data_edicao
      t.string :local_edicao
      t.string :edicao
      t.text :obs
      t.timestamps
    end
  end

  def self.down
    drop_table :mapas
  end
end
