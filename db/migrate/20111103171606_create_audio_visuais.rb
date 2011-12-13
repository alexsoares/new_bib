class CreateAudioVisuais < ActiveRecord::Migration
  def self.up
    create_table :audio_visuais do |t|
      t.references :genero
      t.references :localizacao
      t.string :tombo_seduc
      t.string :tombo_l
      t.string :tipo
      t.string :titulo
      t.string :subtitulo
      t.string :producao
      t.string :local_producao
      t.date :data_producao
      t.string :obs
      t.timestamps
    end
  end

  def self.down
    drop_table :audio_visuais
  end
end
