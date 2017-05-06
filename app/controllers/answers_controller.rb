class AnswersController < ApplicationController
  
  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end
  
  def new
    @question = Question.find(params[:id])
    
    @answer = @question.answers.build
  end
  
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    redirect_to question_answers_path(@question)
    
  end
  
  def edit
  end
  
  def show
  end
  
  def destroy
  end
  
  private
    def answer_params
      params.require(:answer).permit(:body)
    end
    
end
