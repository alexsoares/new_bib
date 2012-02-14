class CreateEmprestimosRealizados < ActiveRecord::Migration
  def self.up
    create_table :emprestimos_realizados do |t|
      t.references :emprestimo
      t.references :dpu
      t.boolean :ativo

      t.timestamps
    end
  end

  def self.down
    drop_table :emprestimos_realizados
  end
end
