class CreateLogs < ActiveRecord::Migration
  def self.up
    create_table :logs do |t|
      t.references :user #Usuário que executou a ação
      t.string :acao #A ação realizada em si: Inclusão / Alteração / Exclusao
      t.string :area #Qual area foi afetada: Cadastros basicos (Identificação/Localização/Areas/Cantores/Livros e afins)
      t.timestamps
    end
  end

  def self.down
    drop_table :logs
  end
end
