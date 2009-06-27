class DadosGeraisTask < Task
  def initialize()
    super('Dados Gerais')
  end

  def execute(doc)

    xpath = '/CURRICULO-VITAE/DADOS-GERAIS'

    nodes_pessoa = doc.find(xpath)
    nodes_pessoa.each do |np|
      d = DadosGerais.new(:nome_completo => np['NOME-COMPLETO'], :sexo => np['SEXO'],
        :cidade_nascimento => np['CIDADE-NASCIMENTO'], :uf_nascimento => np['UF-NASCIMENTO'])
      d.save
      
      # Graduacao
      nodes_graduacao = np.find('FORMACAO-ACADEMICA-TITULACAO/GRADUACAO')
      nodes_graduacao.each do |ng|
        g = Graduacao.new(:dados_gerais_id => d.id, :ano_de_inicio => ng['ANO-DE-INICIO'],
          :ano_de_conclusao => ng['ANO-DE-CONCLUSAO'], :nome_curso => ng['NOME-CURSO'], :nome_instituicao => ng['NOME-INSTITUICAO'])
        g.save
      end
    end

  end

end