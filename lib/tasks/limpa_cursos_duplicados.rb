class LimpaCursosDuplicados < Task
  def initialize
    super('Limpa Cursos Duplicados')
  end

  def execute
    
    # Cursos duplicados
    cursos = Curso.find_duplicates
    cursos.each do |c|
      duplicados = Curso.find_all_by_nome_curso c.nome_curso
      duplicados.each do |d|
        Graduacao.update_all(["curso_id = ?", c.id], ["curso_id = ?", d.id])
        Especializacao.update_all(["curso_id = ?", c.id], ["curso_id = ?", d.id])
        Mestrado.update_all(["curso_id = ?", c.id], ["curso_id = ?", d.id])
        Doutorado.update_all(["curso_id = ?", c.id], ["curso_id = ?", d.id])
        d.delete
      end
    end

  end
end
