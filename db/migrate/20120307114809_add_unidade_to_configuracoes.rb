class AddUnidadeToConfiguracoes < ActiveRecord::Migration
  def self.up
    add_column :configuracoes, :unidade_id, :integer
  end

  def self.down
    remove_column :configuracoes, :unidade_id
  end
end
