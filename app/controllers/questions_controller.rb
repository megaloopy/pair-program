class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @questions = Question.all.order('created_at DESC')
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
      flash[:success] = "Question created!"
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
  
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:danger] = "Question deleted!"
    redirect_to root_path
  end
  
  private
    def question_params
      params.require(:question).permit(:title, :body)
    end
  
end
