require 'active_record'

# establishes the connection to the database
ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "#{File.dirname(__FILE__)}/../db/ar-students.sqlite3")

# path to model files
model_path = File.join(File.dirname(__FILE__), '../app/models')

# require_relative alll files inside app/models
Dir[model_path + "/*.rb"].each { |file| require_relative file }
