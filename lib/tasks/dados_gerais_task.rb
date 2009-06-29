class DadosGeraisTask < Task
  def initialize()
    super('Dados Gerais')
    @instituicoes = {}
    @cursos = {}
    @parser = ParserXML.new
  end

  def execute()
    @parser.parse_libxml {|doc| parse(doc)}
  end

  def parse(doc)

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
          :curso_id => find_curso(ng),
          :ano_de_inicio => ng['ANO-DE-INICIO'],
          :ano_de_conclusao => ng['ANO-DE-CONCLUSAO'],
          :status_do_curso => ng['STATUS-DO-CURSO'])
        g.save
      end

      #Especialização
      nodes_especializacao = np.find('FORMACAO-ACADEMICA-TITULACAO/ESPECIALIZACAO')
      nodes_especializacao.each do |ne|
        m = Especializacao.new(:dados_gerais_id => p.id, :instituicao_id => find_instituicao(ne),
          :curso_id => find_curso(ne),
          :ano_de_inicio => ne['ANO-DE-INICIO'],
          :ano_de_conclusao => ne['ANO-DE-CONCLUSAO'],
          :status_do_curso => ne['STATUS-DO-CURSO'])
        m.save
      end

      #Mba
      nodes_mba = np.find('FORMACAO-ACADEMICA-TITULACAO/MBA')
      nodes_mba.each do |nm|
        m = Mba.new(:dados_gerais_id => p.id, :instituicao_id => find_instituicao(nm),
          :curso_id => find_curso(nm),
          :ano_de_inicio => nm['ANO-DE-INICIO'],
          :ano_de_conclusao => nm['ANO-DE-CONCLUSAO'],
          :status_do_curso => nm['STATUS-DO-CURSO'])
        m.save
      end

      #Mestrado
      nodes_mestrado = np.find('FORMACAO-ACADEMICA-TITULACAO/MESTRADO')
      nodes_mestrado.each do |nm|
        m = Mestrado.new(:dados_gerais_id => p.id, :instituicao_id => find_instituicao(nm),
          :curso_id => find_curso(nm),
          :ano_de_inicio => nm['ANO-DE-INICIO'],
          :ano_de_conclusao => nm['ANO-DE-CONCLUSAO'],
          :status_do_curso => nm['STATUS-DO-CURSO'])
        m.save
      end

      #Doutorado
      nodes_doutorado = np.find('FORMACAO-ACADEMICA-TITULACAO/DOUTORADO')
      nodes_doutorado.each do |nd|
        d = Doutorado.new(:dados_gerais_id => p.id, :instituicao_id => find_instituicao(nd),
          :curso_id => find_curso(nd),
          :ano_de_inicio => nd['ANO-DE-INICIO'],
          :ano_de_conclusao => nd['ANO-DE-CONCLUSAO'],
          :status_do_curso => nd['STATUS-DO-CURSO'])
        d.save
      end

      #Pos-Doutorado
      nodes_pos_doutorado = np.find('FORMACAO-ACADEMICA-TITULACAO/POS-DOUTORADO')
      nodes_pos_doutorado.each do |nd|
        d = PosDoutorado.new(:dados_gerais_id => p.id, :instituicao_id => find_instituicao(nd),
          :curso_id => find_curso(nd),
          :ano_de_inicio => nd['ANO-DE-INICIO'],
          :ano_de_conclusao => nd['ANO-DE-CONCLUSAO'],
          :status_do_curso => nd['STATUS-DO-CURSO'])
        d.save
      end

    end

  end

  private
  def find_curso(node)
    # Curso
    unless @cursos.has_key?(node['CODIGO-CURSO'])
      c = Curso.new(:nome_curso => node['NOME-CURSO'], :codigo_curso => node['CODIGO-CURSO'])
      c.save
      @cursos.store(node['CODIGO-CURSO'], c.id)
      return c.id
    else
      return @cursos[node['CODIGO-CURSO']]
    end
  end

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