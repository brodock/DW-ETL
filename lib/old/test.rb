require "rubygems"
require "xml"

class Test
  attr_reader :files, :doc

  def initialize
    path = "/Users/brodock/Projetos/XML"
    puts "Importador de XML para base relaciona MySQL"
    @files = Dir.glob("#{path}/*.xml")

    @doc = XML::Document.io(File.new(@files.first))
  end
end

doc = Test.new.doc