#encoding: UTF-8
# File : quizDSL_spec.rb

require 'quizDSL'

describe QuizDSL do

    include QuizDSL

    before :all do
    	@quiz = QuizDSL::Quiz.new("Cuestionario") do
			question "Enunciado",
            wrong => "respuesta1",
            right => "respuesta2",
            wrong => "respuesta3",
            wrong => "respuesta4"
	    end
    end

    describe "#Quiz_new" do
        it "Quiz::Quiz" do
            @quiz.should be_an_instance_of QuizDSL::Quiz
        end
    end
        
    describe "#Quiz_name" do 
        it "String" do
            @quiz.name.should be_a String
        end 
        it "Debe responder al método questions" do
            (@quiz.respond_to? :name).should == true
        end
        it "Se debe invocar al método name y devolver el nombre del cuestionario" do
            @quiz.name.should == "Cuestionario"
        end 
    end

    describe "#Quiz_questions" do 
        it "String" do
            @quiz.name.should be_a String
        end 
        it "Debe responder al método questions" do
            (@quiz.respond_to? :questions).should == true
        end
    end

    describe "#Quiz_to_s" do 
        it "String" do
            @quiz.to_s.should be_a String
        end 
        it "Debe responder al método to_s" do
            (@quiz.respond_to? :to_s).should == true
        end
    end

    describe "#Quiz_to_html" do 
        it "Debe responder al método to_html" do
            (@quiz.respond_to? :to_html).should == true
        end
    end

    describe "#Quiz_wrong" do 
        it "Array" do
            @quiz.wrong.should be_a Array
        end 
        it "Debe responder al método wrong" do
            (@quiz.respond_to? :wrong).should == true
        end
        it "Devolverá el contador y false" do
            @quiz.wrong.should == [5, false]
        end
    end

    describe "#Quiz_right" do 
        it "Symbol" do
            @quiz.right.should be_a Symbol
        end 
        it "Debe responder al método right" do
            (@quiz.respond_to? :right).should == true
        end
        it "Devolverá el símbolo right" do
            @quiz.right.should == :right
        end
    end

    describe "#Quiz_run" do 
        it "Debe responder al método run" do
            (@quiz.respond_to? :run).should == true
        end
    end

end