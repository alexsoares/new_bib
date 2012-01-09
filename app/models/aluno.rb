class Aluno < AutenticacaoDatabase
  
  set_table_name 'biblos_pessoas'
  set_primary_key 'id_pessoa'
  D  = %w( 2011)

  def concat_locale
      "#{self.id_escola} - #{self.unidade.nome}"
  end

end