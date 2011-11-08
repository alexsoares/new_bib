class CreateItensAssuntos < ActiveRecord::Migration
  def self.up
    create_table :itens_assuntos do |t|
      t.references :assunto
      t.string :sub_assunto
      t.timestamps
    end
  end

  def self.down
    drop_table :itens_assuntos
  end
end
