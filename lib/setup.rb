require 'benchmark'

# Gems
require 'rubygems'
require 'xml'

# Core of the project
require 'parser'
require 'db'
require 'task'

# Automatically Loads up every Model and Tasks
['/model', '/tasks'].each do |folder|
  Dir.glob(File.join(File.dirname(__FILE__) + folder, '/*.rb')).each {|f| require f }
end
