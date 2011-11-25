class CreateEmprestimos < ActiveRecord::Migration
  def self.up
    create_table :emprestimos do |t|
      t.integer :tipo_emprestimo
      t.references :professor
      t.integer :aluno
      t.timestamps
    end
  end

  def self.down
    drop_table :emprestimos
  end
end
