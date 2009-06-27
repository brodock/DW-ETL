require 'setup'

class Staging

  def initialize
    @task = []
    @task << DadosGeraisTask.new
    @parser = ParserXML.new
  end

  def start
    Benchmark.bm(20) do |x|

      @task.each do |task|
        x.report("Task #{task.name} ") do
          @parser.parse_libxml(task)
        end
      end

    end
  end
end

staging = Staging.new
staging.start