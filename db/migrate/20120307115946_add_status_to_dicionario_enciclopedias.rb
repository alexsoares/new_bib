class AddStatusToDicionarioEnciclopedias < ActiveRecord::Migration
  def self.up
    add_column :dicionario_enciclopedias, :status, :boolean, :default => 1
  end

  def self.down
    remove_column :dicionario_enciclopedias, :status
  end
end
