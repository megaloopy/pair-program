class QuestionsController < ApplicationController
  
  def index
    @questions = Question.all
  end
  
  def show
    @question = Question.find(params[:id])
  end
  
  def new #GET
    @question = Question.new
  end
  
  def create #POST
    @question = Question.new(question_params)
    
    if @question.save
      redirect_to root_path
    else
      render 'new'
    end
      
  end
  
  def edit #GET
  @question = Question.find(params[:id])
  end
  
  def update #PATCH
  @question = Question.find(params[:id])
  
  if @question.update_attributes(question_params)
    redirect_to @question, notice: "Successful"
  else
    render :edit
  end
  end
  
  def delete
  end
  
  def destroy
  end
  
  private
    def question_params
      params.require(:question).permit(:title, :body)
    end
  
end
