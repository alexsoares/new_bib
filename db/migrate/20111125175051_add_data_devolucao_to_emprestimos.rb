class AddDataDevolucaoToEmprestimos < ActiveRecord::Migration
  def self.up
    add_column :emprestimos, :data_devolucao, :date
  end

  def self.down
    remove_column :emprestimos, :data_devolucao
  end
end
