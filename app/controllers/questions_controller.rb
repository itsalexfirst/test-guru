class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :destroy, :edit, :update]
  before_action :find_test, only: [:create, :new]

   rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new
    @question = @test.questions.new
  end

  def show
    @test = @question.test
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit; end

  def update
    @test = @question.test
    if @question.update(question_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test = @question.test
    @question.destroy
    redirect_to @test
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'question not found'
  end
end
