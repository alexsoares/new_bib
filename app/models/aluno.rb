class Aluno < AutenticacaoDatabase
  
  set_table_name 'biblos_pessoas'
  set_primary_key 'id_pessoa'
  D = {"#{Date.today.strftime("%Y")}" => "#{Date.today.strftime("%Y")}"}

  def concat_locale
      "#{self.id_escola} - #{self.unidade.nome}"
  end

  def concat_func
     r =  "#{self.id_escola} - #{self.nome}"
      t = 0
      "#{self.id_escola} - #{self.nome}"
  end


end