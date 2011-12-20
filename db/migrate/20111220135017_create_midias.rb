class CreateMidias < ActiveRecord::Migration
  def self.up
    create_table :midias do |t|
      t.references :genero
      t.references :localizacao
      t.string :tombo_l
      t.string :tombo_seduc
      t.string :tipo
      t.string :titulo
      t.string :subtitulo
      t.string :producao
      t.string :local_producao
      t.datetime :data_producao
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :midias
  end
end
