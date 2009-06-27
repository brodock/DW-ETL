require 'db'
ActiveRecord::Schema.define do
  create_table :dados_gerais do |t|
    t.column :nome_completo, :string
    t.column :sexo, :string
    t.column :cidade_nascimento, :string
    t.column :uf_nascimento, :string, :size => 2
  end

#  create_table :tasks do |t|
#    t.column :description, :string
#    t.column :status, :string
#    t.column :context_id, :integer
#    t.column :project_id, :integer
#  end
#
#  create_table :contexts do |t|
#    t.column :name, :string
#  end
#
#  create_table :projects do |t|
#    t.column :name, :string
#  end
end
