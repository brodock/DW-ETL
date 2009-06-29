class Especializacao < ActiveRecord::Base
  set_table_name 'especializacao'
  
  def before_save
    unless self.ano_de_conclusao.nil? || self.ano_de_inicio.nil?
      self.duracao = self.ano_de_conclusao - self.ano_de_inicio
    end
  end
end
