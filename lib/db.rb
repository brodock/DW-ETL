['/model', '/db'].each do |folder|
  $:.unshift File.dirname(__FILE__) + folder
end
      
require 'test/unit'
require 'rubygems'
require 'activerecord'
          
ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + '/debug.log')
ActiveRecord::Base.establish_connection(YAML.load_file("config/database.yml"))
