class DadosGeraisTask < Task
  def initialize()
    super('Dados Gerais')
  end

  def execute(doc)

    xpath = '/CURRICULO-VITAE/DADOS-GERAIS'

    node = doc.find(xpath)
    node.each do |n|
      d = DadosGerais.new(:nome_completo => n['NOME-COMPLETO'], :sexo => n['SEXO'],
        :cidade_nascimento => n['CIDADE-NASCIMENTO'], :uf_nascimento => n['UF-NASCIMENTO'])
      d.save
    end

  end

end