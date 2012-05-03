class CreateDevolucoes < ActiveRecord::Migration
  def self.up
    create_table :devolucoes do |t|
      t.references :emprestimo
      t.date :data_devolucao

      t.timestamps
    end
  end

  def self.down
    drop_table :devolucoes
  end
end
