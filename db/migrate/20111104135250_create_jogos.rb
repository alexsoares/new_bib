class CreateJogos < ActiveRecord::Migration
  def self.up
    create_table :jogos do |t|
      t.references :localizacao
      t.string :tombo_seduc
      t.string :tombo_l
      t.string :nome
      t.string :faixa_etaria
      t.string :tipo
      t.string :fabricante
      t.string :obs
      t.timestamps
    end
  end

  def self.down
    drop_table :jogos
  end
end
