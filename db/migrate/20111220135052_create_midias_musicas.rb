class CreateMidiasMusicas < ActiveRecord::Migration
  def self.up
    create_table :midias_musicas, :id => false do |t|
      t.references :midia, :null => false
      t.references :musica, :null => false
    end

  end

  def self.down
     drop_table :midias_musicas
  end
end
