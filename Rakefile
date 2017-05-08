require 'rake'
require 'rspec/core/rake_task'
require_relative 'db/config'
require_relative 'lib/students_importer'
require_relative 'app/models/teacher'

desc "opens up console"
task "console" do
  exec "irb -r ./db/config"
end

desc "create the database"
task "db:create" do
  touch 'db/ar-students.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/ar-students.sqlite3'
end

desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
  end
end

desc "populate the students database with sample data"
task "db:populate" do
  StudentsImporter.import
end

desc "populate the teachers database with sample data"
task "db:populate_teacher" do
  Teacher.create(first_name: 'Dill', last_name: "Barracuda", email: "dill@abc.com", phone: "1234567890")
  Teacher.create(first_name: 'Master', last_name: "Teng", email: "masterteng@def.com", phone: "1255557890")
  Teacher.create(first_name: 'Jambu', last_name: "Air", email: "jambuair@pasar.com", phone: "0123456789")
  Teacher.create(first_name: 'Orang', last_name: "Minyak", email: "orang_minyak@hantu.com", phone: "0123446789")
  Teacher.create(first_name: 'Lori', last_name: "Ayam", email: "loriayam@transport.com", phone: "1123456789")
  Teacher.create(first_name: 'Makan', last_name: "Nasi", email: "makan@nasi.com", phone: "1234588890")
  Teacher.create(first_name: 'Pandu', last_name: "Kuda", email: "pandu@kuda.com", phone: "1234566790")
  Teacher.create(first_name: 'Takde', last_name: "Nama", email: "takde@nama.com", phone: "0123345625")
  Teacher.create(first_name: 'Susah', last_name: "Fikir", email: "susah@fikir.com", phone: "6544385532")
  Teacher.create(first_name: 'Lapar', last_name: "Pagi", email: "lapar@pagi.com", phone: "5598634298")
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc "Run the specs"
RSpec::Core::RakeTask.new(:specs)

task :default  => :specs
