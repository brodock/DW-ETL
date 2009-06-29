class Instituicao < ActiveRecord::Base
  set_table_name 'instituicao'

  def before_save
    self.nome_instituicao.nome_proprio!
  end

  def self.find_duplicates
    self.find_by_sql 'SELECT * FROM instituicao i GROUP BY nome_instituicao HAVING count(*) > 1'
  end
end