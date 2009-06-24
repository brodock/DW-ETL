##
# Simple Task - Declara os métodos básicos necessários
#
class Task
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def execute(doc)
    puts "Essa task não definiu um plano de execuçãos"
  end
end
