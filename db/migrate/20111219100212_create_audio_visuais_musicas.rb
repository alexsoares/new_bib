class CreateAudioVisuaisMusicas < ActiveRecord::Migration

  def self.up
    create_table :audio_visuais_musicas, :id => false do |t|
      t.references :audio_visual, :null => false
      t.references :musica, :null => false
    end

  end

  def self.down
     drop_table :audio_visuais_musicas
  end

  
end
