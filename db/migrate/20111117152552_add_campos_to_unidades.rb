class AddCamposToUnidades < ActiveRecord::Migration
  def self.up
    add_column :unidades, :unidades_gpd_id, :integer
    add_column :unidades, :endereco, :string
    add_column :unidades, :num, :integer
    add_column :unidades, :complemento, :string
    add_column :unidades, :bairro, :string
    add_column :unidades, :cidade, :string
    add_column :unidades, :fone, :string
    add_column :unidades, :email, :string
    add_column :unidades, :diretor, :string
    add_column :unidades, :coordenador, :string
    add_column :unidades, :responsavel_bib, :string
    add_column :unidades, :obs, :text
    add_column :unidades, :tipo_id, :integer
  end

  def self.down
    remove_column :unidades, :tipo_id
    remove_column :unidades, :obs
    remove_column :unidades, :responsavel_bib
    remove_column :unidades, :coordenador
    remove_column :unidades, :diretor
    remove_column :unidades, :email
    remove_column :unidades, :fone
    remove_column :unidades, :cidade
    remove_column :unidades, :bairro
    remove_column :unidades, :complemento
    remove_column :unidades, :num
    remove_column :unidades, :endereco
    remove_column :unidades, :unidades_gpd_id
  end
end
