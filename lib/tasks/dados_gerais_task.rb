class DadosGeraisTask < Task
  def initialize()
    super('Dados Gerais')
  end

  def execute(doc)

    xpath = '/CURRICULO-VITAE/DADOS-GERAIS'

    node = doc.find(xpath)
    node.each do |item|
      d = DadosGerais.new(:nome_completo => item['NOME-COMPLETO'], :cidade_nascimento => item['CIDADE-NASCIMENTO'])
      d.save
    end

  end

end