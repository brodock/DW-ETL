require "rubygems"
require "xml"
require "db"

class ParserXML
  attr_reader :files, :tags, :xml

  MAX_AMOUNT_OF_FILES = 200
  def initialize
    @path = "/Users/brodock/Projetos/XML"
    @files = Dir.glob("#{@path}/*.xml")
  end

  def parse_libxml
    resultdoc = XML::Document.new
    resultdoc.root = XML::Node.new 'CURRICULO-VITAE'
    @tags = {}
    @files.each_index do |i|
      if i > MAX_AMOUNT_OF_FILES
        return
      end

      file = File.new(@files[i])
      doc = XML::Document.io(file)
      root = doc.find('/CURRICULO-VITAE').first

      @tags = recursive_walk(root, @tags)
    end
  end

  # Registra uma nova task
  def << task
    @task ||= []
    if task.is_a? Task
      @task << task
    else
      puts "Anexe ao parser, somente Tasks!"
    end
    
  end
end