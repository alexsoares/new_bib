class CreateCantoresAudioVisuais < ActiveRecord::Migration
  def self.up
    create_table :cantores_audio_visuais, :id => false do |t|
      t.references :autor, :null => false
      t.references :audio_visual, :null => false
    end

  end

  def self.down
    drop_table :cantores_audio_visuais
  end
end
