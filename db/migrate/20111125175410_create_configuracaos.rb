class CreateConfiguracaos < ActiveRecord::Migration
  def self.up
    create_table :configuracaos do |t|
      t.references :user
      t.datetimes :data_criacao
      t.integer :dias_posse
      t.integer :dias_para_aviso
      t.timestamps
    end
  end

  def self.down
    drop_table :configuracaos
  end
end
