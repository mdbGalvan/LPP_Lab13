$:.unshift File.dirname(__FILE__) + 'lib'

require "bundler/gem_tasks"

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :default => :spec

require 'rake/testtask'

desc "Se ejecutan todas las pruebas que se han programado."
Rake::TestTask.new do |t|
    t.libs << "test"
	# test_files: Define explicitamente la lista de archivos de prueba para ser incluidos en una prueba.
    t.test_files = FileList['test/tc_*.rb']
    t.verbose = true # Detalle
end

desc "Run Quiz with a example"
task :example do
	sh "ruby -Ilib bin/quizDSL_main.rb"
end

desc "Run rspec with --format documentation"
task :doc do
  sh "rspec -Ilib spec/*.rb --format documentation --color"
end

desc "Run RDoc with -o --main"
task :rdoc do
	sh "rdoc -o documentation --main lib/quizDSL.rb"
end
