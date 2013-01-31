#encoding: UTF-8

require 'quizDSL'
include QuizDSL

if __FILE__ == $0

	quiz = Quiz.new("Gemas") do

    	question "¿Qué comando permite manipular gemas?",
        wrong => "bundler",
        right => "gem",
        wrong => "Rubygems",
        wrong => "gem install"

     	question "¿Cómo se puede encontrar la gema, mygem, en la máquina local?",
        wrong => "gem search mygem --b",
        right => "gem search mygem --l",
        wrong => "gem search mygem -remote",
        wrong => "gem search mygem -local"

        question "¿Cómo se denomina el repositorio estándar de gemas?",
        wrong => "/etc/gem/",
        wrong => "Repository Gem",
        right => "Rubygems",
        wrong => "RubyGemas"

        question "Enunciado",
        wrong => "respuesta1",
        right => "respuesta2",
        wrong => "respuesta3",
        wrong => "respuesta4"
        
	end

	quiz.run

end