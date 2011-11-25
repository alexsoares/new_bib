class AddCampoValidacaoToFuncionarios < ActiveRecord::Migration
  def self.up
    add_column :funcionarios, :campo_validacao, :string
  end

  def self.down
    remove_column :funcionarios, :campo_validacao
  end
end
