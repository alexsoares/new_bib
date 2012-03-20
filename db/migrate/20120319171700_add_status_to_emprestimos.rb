class AddStatusToEmprestimos < ActiveRecord::Migration
  def self.up
    add_column :emprestimos, :status, :boolean
  end

  def self.down
    remove_column :emprestimos, :status
  end
end
