class Mestrado < ActiveRecord::Base
  set_table_name 'mestrado'

  def before_save
    unless self.ano_de_conclusao.nil? || self.ano_de_inicio.nil?
      self.duracao = self.ano_de_conclusao - self.ano_de_inicio
    end
  end
end
