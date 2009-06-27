require 'db'
ActiveRecord::Schema.define do
  create_table :dados_gerais, :force => true do |t|
    t.column :nome_completo, :string
    t.column :sexo, :string
    t.column :cidade_nascimento, :string
    t.column :uf_nascimento, :string, :size => 2
  end
  
  create_table :instituicao, :force => true do |t|
    t.column :nome_instituicao, :string
  end

  create_table :graduacao, :force => true do |t|
    t.column :dados_gerais_id, :integer
    t.column :instituicao_id, :integer
    t.column :ano_de_inicio, :integer, :size => 4
    t.column :ano_de_conclusao, :integer, :size => 4
    t.column :status_do_curso, :string, :limit => 12
    t.column :nome_curso, :string
  end
  
  create_table :mestrado, :force => true do |t|
    t.column :dados_gerais_id, :integer
    t.column :instituicao_id, :integer
    t.column :ano_de_inicio, :integer, :size => 4
    t.column :ano_de_conclusao, :integer, :size => 4
    t.column :status_do_curso, :string, :limit => 12
    t.column :nome_curso, :string
  end

  create_table :doutorado, :force => true do |t|
    t.column :dados_gerais_id, :integer
    t.column :instituicao_id, :integer
    t.column :ano_de_inicio, :integer, :size => 4
    t.column :ano_de_conclusao, :integer, :size => 4
    t.column :status_do_curso, :string, :limit => 12
    t.column :nome_curso, :string
  end

end
