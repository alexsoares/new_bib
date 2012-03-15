class AddDtsToEmprestimos < ActiveRecord::Migration
  def self.up
    add_column :emprestimos, :dias_atrasados, :integer
  end

  def self.down
    remove_column :emprestimos, :dt_emprestimo
  end
end
