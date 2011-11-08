class CreateIdentificacaos < ActiveRecord::Migration
  def self.up
    create_table :identificacaos do |t|
      t.integer :codigo
      t.string :livro
      t.string :subtitulo
      t.text :obs
      t.timestamps
    end
  end

  def self.down
    drop_table :identificacaos
  end
end
