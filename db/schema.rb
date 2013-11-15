# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130806115009) do

  create_table "contas", :force => true do |t|
    t.string   "descricao"
    t.float    "limite"
    t.boolean  "inativo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "eventos", :force => true do |t|
    t.string   "descricao"
    t.boolean  "debido"
    t.integer  "prazo_id"
    t.integer  "grupo_evento_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "grupo_eventos", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lancamentos", :force => true do |t|
    t.boolean  "confirmado"
    t.date     "data"
    t.integer  "evento"
    t.boolean  "debito"
    t.float    "valor"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "conta_id"
  end

  create_table "prazos", :force => true do |t|
    t.string   "descricao"
    t.string   "funcao"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "produtos", :force => true do |t|
    t.string   "descricao"
    t.string   "descricao_sitef"
    t.integer  "prazo_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "registro_sitefs", :force => true do |t|
    t.boolean  "lancado"
    t.string   "nsu_host"
    t.string   "codigo_transacao"
    t.string   "indentifi_pdv"
    t.string   "codi_resp"
    t.string   "estado_trasacao"
    t.string   "numero_cartao_banco_ag_co"
    t.string   "valor"
    t.string   "num_par"
    t.string   "autorizador"
    t.string   "data_lancamen"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "nome_produto"
    t.string   "hora"
    t.string   "nsu_sitef"
  end

  create_table "sitef_files", :force => true do |t|
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "arquivo_file_name"
    t.string   "arquivo_content_type"
    t.integer  "arquivo_file_size"
    t.datetime "arquivo_updated_at"
    t.date     "dia_correspondente"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
