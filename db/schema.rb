# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111125090211) do

  create_table "areas", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assuntos", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assuntos_livros", :id => false, :force => true do |t|
    t.integer "assunto_id", :null => false
    t.integer "livro_id",   :null => false
  end

  create_table "audio_visuais", :force => true do |t|
    t.integer  "genero_midia_id"
    t.integer  "localizacao_id"
    t.string   "tombo_seduc"
    t.string   "tombo_l"
    t.string   "tipo"
    t.string   "titulo"
    t.string   "subtitulo"
    t.string   "producao"
    t.string   "local_producao"
    t.date     "data_producao"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "autores", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "autores_livros", :id => false, :force => true do |t|
    t.integer "autor_id", :null => false
    t.integer "livro_id", :null => false
  end

  create_table "dicionario_enciclopedias", :force => true do |t|
    t.integer  "editora_id"
    t.integer  "area_id"
    t.integer  "localizacao_id"
    t.integer  "identificacao_id"
    t.string   "tombo_seduc"
    t.string   "tombo_l"
    t.string   "colecao"
    t.string   "tipo"
    t.integer  "volume"
    t.date     "data_edicao"
    t.string   "local_edicao"
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "editoras", :force => true do |t|
    t.string   "nome"
    t.string   "cidade"
    t.string   "pais"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emprestimos", :force => true do |t|
    t.integer  "tipo_emprestimo"
    t.integer  "professor_id"
    t.integer  "aluno"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "funcionarios", :force => true do |t|
    t.string   "nome"
    t.integer  "matricula"
    t.integer  "unidade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "campo_validacao"
  end

  create_table "identificacaos", :force => true do |t|
    t.integer  "codigo"
    t.string   "livro"
    t.string   "subtitulo"
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "itens_assuntos", :force => true do |t|
    t.integer  "assunto_id"
    t.string   "sub_assunto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "itens_emprestimos", :force => true do |t|
    t.integer  "emprestimo_id"
    t.integer  "audio_visual_id"
    t.integer  "livro_id"
    t.integer  "dicionario_enciclopedia_id"
    t.integer  "mapas_id"
    t.integer  "periodico_id"
    t.integer  "jogo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jogos", :force => true do |t|
    t.integer  "localizacao_id"
    t.string   "tombo_seduc"
    t.string   "tombo_l"
    t.string   "nome"
    t.string   "faixa_etaria"
    t.string   "tipo"
    t.string   "fabricante"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "livros", :force => true do |t|
    t.integer  "identificacao_id"
    t.integer  "area_id"
    t.integer  "editora_id"
    t.integer  "localizacao_id"
    t.integer  "tombo_seduc",      :default => 0
    t.string   "tombo_l"
    t.string   "colecao"
    t.string   "edicao"
    t.date     "data_edicao"
    t.string   "local_edicao"
    t.text     "resumo"
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "autor"
    t.boolean  "status",           :default => true
  end

  create_table "localizacoes", :force => true do |t|
    t.integer  "unidade_id"
    t.string   "local_guardado"
    t.string   "aquisicao"
    t.date     "data_aquisicao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mapas", :force => true do |t|
    t.integer  "editora_id"
    t.integer  "localizacao_id"
    t.string   "tombo_seduc"
    t.string   "tombo_l"
    t.string   "tipo"
    t.string   "subtitulo"
    t.date     "ano"
    t.string   "formato"
    t.date     "data_edicao"
    t.string   "local_edicao"
    t.string   "edicao"
    t.text     "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "titulo"
  end

  create_table "musicas", :force => true do |t|
    t.string   "nome"
    t.string   "interprete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periodicos", :force => true do |t|
    t.integer  "localizacao_id"
    t.string   "tombo_seduc"
    t.string   "tombo_l"
    t.string   "tipo"
    t.string   "titulo"
    t.string   "subtitulo"
    t.string   "colecao"
    t.string   "producao"
    t.string   "periodicidade"
    t.integer  "issn"
    t.string   "local_producao"
    t.date     "data_producao"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "tipos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unidades", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unidades_gpd_id"
    t.string   "endereco"
    t.integer  "num"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "fone"
    t.string   "email"
    t.string   "diretor"
    t.string   "coordenador"
    t.string   "responsavel_bib"
    t.text     "obs"
    t.integer  "tipo_id"
  end

  create_table "unidades_gpds", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.integer  "unidade_id"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
