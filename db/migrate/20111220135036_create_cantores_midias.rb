class CreateCantoresMidias < ActiveRecord::Migration
  def self.up
    create_table :cantores_midias, :id => false do |t|
      t.references :midia, :null => false
      t.references :cantor, :null => false
    end

  end

  def self.down
    drop_table :cantores_midias
  end
end
