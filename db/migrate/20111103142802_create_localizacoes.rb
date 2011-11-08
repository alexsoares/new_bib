class CreateLocalizacoes < ActiveRecord::Migration
  def self.up
    create_table :localizacoes do |t|
      t.references :unidade
      t.string :local_guardado
      t.string :aquisicao
      t.date :data_aquisicao
      t.timestamps
    end
  end

  def self.down
    drop_table :localizacoes
  end
end
