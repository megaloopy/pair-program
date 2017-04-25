class AnswersController < ApplicationController
  
  def index
    @answers = Answer.all
  end
  
  def new
    @answer = Answer.new
  end
  
  def create
    @answer = current_user.answer.build(params[:question_id])
    
      if @answer.save
        redirect_to :back, flash[:info] = "Your answer has been published"
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
