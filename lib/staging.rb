require 'setup'

class Staging

  BENCHMARK_NAME_CHARS = 35
  def initialize
    @task = []
    @task << DadosGeraisTask.new
    @task << LimpaCursosDuplicados.new
    @task << LimpaInstituicoesDuplicadas.new
  end

  def menu
    while(true) do
      puts
      puts "Selecione a task a ser executada:"
      puts "---------------------------------"
      puts "T - Todas as Tasks"
      puts "S - Sair"

      @task.each_index do |seq|
        puts "#{seq+1} - #{@task[seq].name}"
      end

      input = gets.chomp
      if (input =~ /^[Tt]$/)
        puts "Executando todas as Tasks"
        batch_start
      elsif (input =~ /^[Ss]$/)
        puts "Até mais!"
        return
      else
        task = @task[input.to_i-1]
        if task.nil?
          puts "Task inexistente!"
        else
          start(task)
        end
      end
     
    end
  end

  def start(task)
    Benchmark.bm(BENCHMARK_NAME_CHARS) do |x|
      x.report("Task #{task.name}") do
        task.execute
      end
    end
  end

  def batch_start
    Benchmark.bm(BENCHMARK_NAME_CHARS) do |x|

      @task.each do |task|
        x.report("Task #{task.name} ") do
          task.execute
        end
      end

    end
  end
end

staging = Staging.new
staging.menu