class CreateMusicasAudioVisuais < ActiveRecord::Migration

  def self.up
    create_table :musicas_audio_visuais, :id => false do |t|
      t.references :musica, :null => false
      t.references :audio_visual, :null => false
    end

  end

  def self.down
     drop_table :musicas_audio_visuais
  end
end
