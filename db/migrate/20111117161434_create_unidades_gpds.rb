class CreateUnidadesGpds < ActiveRecord::Migration
  def self.up
    create_table :unidades_gpds do |t|
      t.string :nome

      t.timestamps
    end
  end

  def self.down
    drop_table :unidades_gpds
  end
end
