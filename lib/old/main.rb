require "rubygems"
require "hpricot"

class Parser  
  
  attr_reader :files
  
  def initialize(path)
    puts "Importador de XML para base relaciona MySQL"    
    @files = Dir.glob("#{path}/*.xml")
  end

  def parse_person
    @files.each do |f|
      doc = Hpricot.XML(open(f))
    end
  end
  
  def find_all_tags
    @files.each do |f|
      puts "Abrindo #{f}"
      doc = Hpricot.XML(open(f))
      (doc/"CURRICULO-VITAE").each do |e|
        e.
      end
    end
  end

  def statistics
    puts "Arquivos encontrados: #{@files.size}"
  end
end

XML_PATH = "/Users/brodock/Projetos/XML"
parser = Parser.new(XML_PATH)
parser.statistics
parser.find_all_tags