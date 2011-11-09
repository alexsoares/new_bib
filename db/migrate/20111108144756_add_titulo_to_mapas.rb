class AddTituloToMapas < ActiveRecord::Migration
  def self.up
    add_column :mapas, :titulo, :string
  end

  def self.down
    remove_column :mapas, :titulo
  end
end
