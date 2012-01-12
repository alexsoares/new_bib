class CreateTombos < ActiveRecord::Migration
  def self.up
    create_table :tombos do |t|
      t.references :user
      t.references :livro
      t.string :index_tombo
      t.timestamps
    end
  end

  def self.down
    drop_table :tombos
  end
end
