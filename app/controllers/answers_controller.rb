class AnswersController < ApplicationController
  
  def index
    question = Question.find(params[:question_id])
    @answers = question.answers
  end
  
  def new
    @question = Question.find(params[:id])
    
    @answer = @question.answers.build
  end
  
  def create
   question = Question.find(params[:question_id])
   @answer = question.answer.save
    
    if @answer.save
      redirect_to question_answer_path, flash[:info] = "Your answer has been published"
    else flash[:danger] = "Your answer wasn't saved Mofo!" 
      render :form
    end  
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
