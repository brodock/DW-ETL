require "rubygems"
require "xml"
#require "db"

class ParserXML
  attr_reader :files, :tags, :xml

  MAX_AMOUNT_OF_FILES = 500
  def initialize
    @path = "/Users/brodock/Projetos/XML"
    @files = Dir.glob("#{@path}/*.xml")
  end

  def parse_libxml(task)
    resultdoc = XML::Document.new
    resultdoc.root = XML::Node.new 'CURRICULO-VITAE'
    @tags = {}
    @files.each_index do |i|
      if i > MAX_AMOUNT_OF_FILES
        return
      end

      file = File.new(@files[i])
      doc = XML::Document.io(file, :encoding => XML::Encoding::ISO_8859_1)
      task.execute(doc)
    end
  end
end