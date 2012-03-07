class AddStatusToDicionarioEnciclopedias < ActiveRecord::Migration
  def self.up
    add_column :dicionario_enciclopedias, :status, :boolean
  end

  def self.down
    remove_column :dicionario_enciclopedias, :status
  end
end
