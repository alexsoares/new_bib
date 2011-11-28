class AddDataEmprestimoToEmprestimos < ActiveRecord::Migration
  def self.up
    add_column :emprestimos, :data_emprestimo, :date
  end

  def self.down
    remove_column :emprestimos, :data_emprestimo
  end
end
