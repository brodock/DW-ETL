require 'db'
ActiveRecord::Schema.define do
  create_table :dados_gerais do |t|
    t.column :nome_completo, :string
    t.column :sexo, :string
    t.column :cidade_nascimento, :string
    t.column :uf_nascimento, :string, :size => 2
  end

  create_table :graduacao do |t|
    t.column :dados_gerais_id, :integer
    t.column :ano_de_inicio, :integer
    t.column :ano_de_conclusao, :integer
    t.column :nome_curso, :string
    t.column :nome_instituicao, :string
  end

end
