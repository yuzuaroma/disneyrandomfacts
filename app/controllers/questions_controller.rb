class QuestionsController < ApplicationController
    def index
    end
  
    def new
      @question = Question.new
    end
  
    def show
      @question = Question.find_by(id: params[:id])
    end
  
    def create
      @question = Question.new(question_params)
      params[:question][:question] ? @question.question = params[:question][:question].join("") : false
      if @question.save
          flash[:notice] = "診断が完了しました"
          redirect_to question_path(@question.id)
      else
          redirect_to :action => "new"
      end
    end
  
  
  private
    def question_params
        params.require(:question).permit(:id, question: [])
    end
  end