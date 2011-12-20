class CreateAudioVisuaisCantores < ActiveRecord::Migration
  def self.up
    create_table :audio_visuais_cantores, :id => false do |t|
      t.references :audio_visual, :null => false
      t.references :cantor, :null => false
    end

  end

  def self.down
    drop_table :audio_visuais_cantores
  end
end
