require 'rubygems'
require 'activerecord'
          
ActiveRecord::Base.logger = false
ActiveRecord::Base.colorize_logging = false
ActiveRecord::Base.establish_connection(YAML.load_file("config/database.yml"))
