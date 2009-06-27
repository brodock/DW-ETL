class DadosGeraisTask < Task
  def initialize()
    super('Dados Gerais')
    @instituicoes = {}
  end

  def execute(doc)

    xpath = '/CURRICULO-VITAE/DADOS-GERAIS'

    nodes_pessoa = doc.find(xpath)
    nodes_pessoa.each do |np|
      p = DadosGerais.new(:nome_completo => np['NOME-COMPLETO'], :sexo => np['SEXO'],
        :cidade_nascimento => np['CIDADE-NASCIMENTO'], :uf_nascimento => np['UF-NASCIMENTO'])
      p.save
      
      # Graduacao
      nodes_graduacao = np.find('FORMACAO-ACADEMICA-TITULACAO/GRADUACAO')
      nodes_graduacao.each do |ng|
        g = Graduacao.new(:dados_gerais_id => p.id, :instituicao_id => find_instituicao(ng),
          :ano_de_inicio => ng['ANO-DE-INICIO'],
          :ano_de_conclusao => ng['ANO-DE-CONCLUSAO'],
          :nome_curso => ng['NOME-CURSO'],
          :status_do_curso => ng['STATUS-DO-CURSO'])
        g.save
      end

      #Mestrado
      nodes_mestrado = np.find('FORMACAO-ACADEMICA-TITULACAO/MESTRADO')
      nodes_mestrado.each do |nm|
        m = Mestrado.new(:dados_gerais_id => p.id, :instituicao_id => find_instituicao(nm),
          :ano_de_inicio => nm['ANO-DE-INICIO'],
          :ano_de_conclusao => nm['ANO-DE-CONCLUSAO'],
          :nome_curso => nm['NOME-CURSO'],
          :status_do_curso => nm['STATUS-DO-CURSO'])
        m.save
      end

      #Doutorado
      nodes_doutorado = np.find('FORMACAO-ACADEMICA-TITULACAO/DOUTORADO')
      nodes_doutorado.each do |nd|
        d = Doutorado.new(:dados_gerais_id => p.id, :instituicao_id => find_instituicao(nd),
          :ano_de_inicio => nd['ANO-DE-INICIO'],
          :ano_de_conclusao => nd['ANO-DE-CONCLUSAO'],
          :nome_curso => nd['NOME-CURSO'],
          :status_do_curso => nd['STATUS-DO-CURSO'])
        d.save
      end


    end

  end

  @private
  def find_instituicao(node)
    # Instituicao
    unless @instituicoes.has_key?(node['NOME-INSTITUICAO'])
      i = Instituicao.new(:nome_instituicao => node['NOME-INSTITUICAO'])
      i.save
      @instituicoes.store(node['NOME-INSTITUICAO'], i.id)
      return i.id
    else
      return @instituicoes[node['NOME-INSTITUICAO']]
    end
  end

end