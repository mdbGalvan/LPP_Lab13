# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quizDSL/version'

Gem::Specification.new do |gem|
  gem.name          = "ull-etsii-alu3299-quizDSL"
  gem.version       = QuizDSL::VERSION
  gem.authors       = ["mdbgalvan"]
  gem.email         = ["magomenlopark@gmail.com"]
  gem.description   = %q{Redacción de Cuestionarios II (Usando Contexto)}
  gem.summary       = %q{Redacta cuestionarios de seleccion multiple}
  gem.homepage      = "https://github.com/mdbGalvan/LPP_Lab13"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'rdoc'
  gem.add_development_dependency 'rb-readline'
end
