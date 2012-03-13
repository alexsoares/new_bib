class AddDtsToEmprestimos < ActiveRecord::Migration
  def self.up
    add_column :emprestimos, :dt_emprestimo, :date
    add_column :emprestimos, :dt_devolucao, :date
    add_column :emprestimos, :dias_atrasados, :integer
  end

  def self.down
    remove_column :emprestimos, :dias_atrasados
    remove_column :emprestimos, :dt_devolucao
    remove_column :emprestimos, :dt_emprestimo
  end
end
