# File : tc_quizDSL.rb

require "quizDSL"
require "test/unit"

class TestQuiz < Test::Unit::TestCase
	def setup
		@quiz = QuizDSL::Quiz.new("Cuestionario") do
			question "Enunciado",
            wrong => "respuesta1",
            right => "respuesta2",
            wrong => "respuesta3",
            wrong => "respuesta4"
	    end
	end

	def test_implements_name
		assert_equal true, @quiz.respond_to?("name")
	end

	def test_implements_questions
		assert_equal true, @quiz.respond_to?("questions")
	end

	def test_implements_to_s
		assert_equal true, @quiz.respond_to?("to_s")
	end

	def test_implements_to_html
		assert_equal true, @quiz.respond_to?("to_html")
	end

	def test_implements_wrong
		assert_equal true, @quiz.respond_to?("wrong")
	end

	def test_implements_right
		assert_equal true, @quiz.respond_to?("right")
	end

	def test_implements_run
		assert_equal true, @quiz.respond_to?("run")
	end
end