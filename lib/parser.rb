class ParserXML
  attr_reader :files, :tags, :xml

  MAX_AMOUNT_OF_FILES = 5000
  def initialize
    @path = "/Users/brodock/Projetos/XML"
    @files = Dir.glob("#{@path}/*.xml")
  end

  def parse_libxml(task)
    resultdoc = XML::Document.new
    resultdoc.root = XML::Node.new 'CURRICULO-VITAE'
    @tags = {}
    
    ActiveRecord::Base.transaction do
      
      @files.each_index do |i|
        if i > MAX_AMOUNT_OF_FILES
          return
        end

        file = File.new(@files[i])
        begin
          doc = XML::Document.io(file, :encoding => XML::Encoding::ISO_8859_1)
          task.execute(doc)
        rescue LibXML::XML::Error => e
          puts "Falha ao processar arquivo: #{@files[i]} (#{i})"
          puts "Erro: #{e}"
          puts "------------------------------------------------"
        end
      end

    end

  end
end