['/model', '/db'].each do |folder|
  $:.unshift File.dirname(__FILE__) + folder
end
      
require 'test/unit'
require 'rubygems'
require 'activerecord'
          
#ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + '/debug.log')
#ActiveRecord::Base.configurations = YAML::load(IO.read(File.dirname(__FILE__) + '/config/database.yml'))
#ActiveRecord::Base.establish_connection('mysql5')
              
#require 'schema'
