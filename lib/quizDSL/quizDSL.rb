# File : quizDSL.rb

require "quizDSL/version"

module QuizDSL

	module_function

	WRONG = false
	RIGHT = true

		# Debe definir una clase Quiz que soporte un pequeño lenguaje 
		# en el que las preguntas puedan ser especificadas.
		# Puede que le interese crear tres clases, una tercera para el cuestionario (Quiz)
		class Quiz

			attr_accessor :name, :questions

			# El constructor de Quiz va seguido de un bloque al que le
			# pasa como argumento el objeto e que representa al examen
			# quiz = Quiz.new("Cuestionario de PFS 10/12/2011") do |e| ... end
			def initialize(name, &b)
				raise ArgumentError unless name.is_a? String
				@counter = 0
				@questions = []
				@name = name
				@aciertos = 0

				instance_eval &b
			end

			# Los cuestionarios deberían tener un método to_s 
			# que devuelve un String conteniendo el examen en texto plano.
			# Devuelve el título, y llama a imprimir las preguntas
			def to_s
				out = "\t #{self.name} \n"
				questions.each do |q|
					out << " #{q}\n"
				end
				out
			end

			# Los cuestionarios deberían tener un método run que formulará cada 
			# una de las preguntas del cuestionario y mostrara el porcentaje de aciertos
			def run
				puts "\t #{self.name} \n"
				questions.each do |q|
					puts q
					print "Su respuesta: "
					resp = gets.chomp.to_i
					raise IndexError unless resp > 0 and resp <= q.answer.size
					if q.answer[resp-1].state
						puts "Correcto!"
						@aciertos += 1
					else
						correcta = q.answer.select { |ans| ans.state }.first
						puts "Fallo, la respuesta correcta era #{correcta}"
					end
					puts
				end
				puts "Has acertado el #{(@aciertos/questions.size.to_f)*100}% de las preguntas [#{@aciertos} de #{questions.size}]."
			end

			# El método question recibe dos argumentos
			# El primero es el título del examen, el segundo es un hash
			# Si el segundo argumento de question es un hash y las claves son :wrong y :right 
			# se va a producir una colisión y el último valor sobreescribirá a los anteriores. 
			def question (title, anss)
				answers = []

				anss.each do |ans|
					a = Answer.new(ans)
					answers << a
				end

				q = Question.new(title, answers)
				questions << q
			end

			# Una posible forma de hacerlo es que los métodos wrong y right diferencien las 
			# ocurrencias de las respuestas usando un contador @counter
			def wrong
				@counter += 1
				[@counter, WRONG]
			end

			def right
				:right
			end

			def to_html
				# Crea un nuevo fichero, y escribe
				File.open('html/index.html', 'w') do |fout|

					fout.puts '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">'
					fout.puts '<html xmlns="http://www.w3.org/1999/xhtml">'
					fout.puts '<head>'
					fout.puts "\t" + '<link href="css.css" rel="stylesheet" type="text/css" />'
					fout.puts "\t" + '<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />'
					fout.puts "\t" + '<title>Cuestionario</title>'
					fout.puts '</head>'
					fout.puts '<body>'

					fout.puts "\t" + '<form name="myform" action="http://proyecto.bonoqr.comze.com/" method="POST">'
					fout.puts "\t\t" + '<div id="quiz"><br>'

					fout.puts "\t\t\t<center><h1> #{self.name} </h1></center>"
					questions.each do |q|
						fout.puts " #{q.to_html}\n"
					end

					fout.puts "\t\t\t<hr>"
					fout.puts "\t\t\tHas acertado el #{(@aciertos/questions.size.to_f)*100}% de las preguntas [#{@aciertos} de #{questions.size}]."

					fout.puts '</div>'
					fout.puts '</form>'

					fout.puts '</body>'
					fout.puts '</html>'

				
				end
			end
		end

		# Puede que le interese crear tres clases, una para modelar las respuestas (Answer)
		class Answer 

			attr_reader :state, :value

			def initialize(ans)
				raise ArgumentError unless ans.is_a? Array
				raise IndexError unless ans.size == 2
				state = ans[0]
				value = ans[1]
				state == :right ? @state = RIGHT : @state = WRONG
				@value = value
			end

			# Los cuestionarios deberían tener un método to_s 
			# que devuelve un String conteniendo el examen en texto plano.
			# Devuelve el resultado es estado del resultado
			def to_s
				"#{@value}"
			end

		end

		# Puede que le interese crear tres clases, otra para modelar las preguntas (Question)
		class Question

			attr_accessor :answer, :title

			def initialize(title, answer)
				@title = title
				@answer = answer
			end

			# Los cuestionarios deberían tener un método to_s 
			# que devuelve un String conteniendo el examen en texto plano.
			# Devuelve cada pregunta y sus opciones
			def to_s
				out = "#{@title}" + "\n"
                i = 1
                answer.each do |a|
                    out << "  [#{i}] #{a}\n"
                    i += 1
                end
                out
			end

			def to_html
				out = "\t\t\t<p><h3>#{@title}</h3></p>\n"
                i = 1
                answer.each do |a|
                	out << "\t\t\t\t<p>" + '<input type="radio" name="' + "#{@title}" + '" value="' + "#{a}" + '">' + "   [#{i}] #{a}" + "</p>\n"
                    i += 1
                end
                out
			end

			def size
				@answer.size
			end

		end

end
