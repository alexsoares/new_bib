class CreateDpusEmprestimos < ActiveRecord::Migration
  def self.up
    create_table :dpus_emprestimos, :id => false do |t|
      t.references :dpu, :null => false
      t.references :emprestimo, :null => false
    end

  end

  def self.down
    drop_table :dpus_emprestimos
  end
end
