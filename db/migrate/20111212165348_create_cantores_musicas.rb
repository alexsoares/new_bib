class CreateCantoresMusicas < ActiveRecord::Migration

 def self.up
    create_table :cantores_musicas, :id => false do |t|
      t.references :cantor, :null => false
      t.references :musica, :null => false
    end

  end

  def self.down
    drop_table :cantores_musicas
  end
end
