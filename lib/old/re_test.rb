require "rubygems"
require "xml"
require "benchmark"

puts "Importador de XML para base relaciona MySQL"

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

  protected
  def recursive_walk(tree, tags)

    tree.each do |c|
        unless tags.member?(c.name) # Se não existir no hash, armazenar o node
            node = c.copy(true)
            node.child = nil
            array = []
            array[0] = {}
            array[1] = node
            tags.store(c.name, array)
        end

        unless c.child.nil?
            tags[c.name][0] = recursive_walk(c.child, tags[c.name][0])
        end
    end
    tags
  end

  def recursive_walk_old(tree, tags)
    arraytags = {}
    arraynodes = []
    unless tree.child.nil?

      tree.child.each do |c|
        unless tags.member?(c.name) # Tag nova, vamos adicionar
          
          node = c.copy(true)
          childrens = recursive_walk(c, arraytags)

          unless childrens.nil?

            if childrens.member?('nodes')
              childrens.each do |cn|
                node << cn.copy(true) if cn.is_a?(XML::Node)
              end
            end
            tags.store(c.name, childrens['tags'])
          else
            tags.store(c.name, nil)
          end
          arraynodes << node.copy(true)
          
        end
      end

      result = {}
      result.store 'tags', tags
      result.store 'nodes', arraynodes
      result
    end
  end
end

Benchmark.bm do |x|
  x.report("Instantiation ") { @t = ParserXML.new }
  x.report("Parse with LibXML") { @t.parse_libxml }
end

#outdoc = REXML::Document.new(@t.xml.to_s)
#outdoc.write($stdout, 2)

