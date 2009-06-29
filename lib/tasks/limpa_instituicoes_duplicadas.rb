class LimpaInstituicoesDuplicadas < Task
  def initialize
    super('Limpa Instituicoes Duplicadas')
  end

  def execute

    # Instituicoes duplicadas
    instituicoes = Instituicao.find_duplicates
    instituicoes.each do |i|
      duplicados = Instituicao.find_all_by_nome_instituicao i.nome_instituicao
      duplicados.each do |d|
        Graduacao.update_all(["instituicao_id = ?", i.id], ["instituicao_id = ?", d.id])
        Especializacao.update_all(["instituicao_id = ?", i.id], ["instituicao_id = ?", d.id])
        Mestrado.update_all(["instituicao_id = ?", i.id], ["instituicao_id = ?", d.id])
        Doutorado.update_all(["instituicao_id = ?", i.id], ["instituicao_id = ?", d.id])
        d.delete
      end
    end

  end
end
