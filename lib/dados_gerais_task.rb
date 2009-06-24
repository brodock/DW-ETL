class DadosGeraisTask < Task
  def initialize()
    super('Dados Gerais')
  end

  def execute(doc)
    attributes = []
    attributes << 'NOME-COMPLETO'
    attributes << 'CIDADE-NASCIMENTO'

    xpath = '/CURRICULO-VITAE/DADOS-GERAIS'

    node = doc.find(xpath)
    node.each do |item|
      attributes.each do |attr|
        print item[attr], ' '
      end
      puts
    end

  end

end