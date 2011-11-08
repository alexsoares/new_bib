class CreateUnidades < ActiveRecord::Migration
  def self.up
    create_table :unidades do |t|
      t.string :nome
      t.integer :tipo
      t.timestamps
    end
  end

  def self.down
    drop_table :unidades
  end
end
