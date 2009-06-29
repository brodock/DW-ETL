class Curso < ActiveRecord::Base
  set_table_name 'curso'

  def before_save
    self.nome_curso.nome_proprio! unless self.nome_curso.nil?
  end

  def self.find_duplicates
    self.find_by_sql 'SELECT * FROM curso c GROUP BY nome_curso HAVING count(*) > 1'
  end
end