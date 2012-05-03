# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format 
# (all these examples are active by default):
 ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
  inflect.irregular 'genero_midia', 'genero_midias'
  inflect.irregular 'audio_visual', 'audio_visuais'
  inflect.irregular 'identificaocao', 'identificacoes'
  inflect.irregular 'localizacao','localizacoes'
  inflect.irregular 'cantor','cantores'
  inflect.irregular 'item','itens'
  inflect.irregular 'autor','autores'
  inflect.irregular 'configuracao', 'configuracoes'
  inflect.irregular 'devolucao', 'devolucoes'
 end
