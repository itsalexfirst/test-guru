class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :destroy, :edit, :update]
  before_action :find_test, only: [:index, :create, :new]

  def index
    redirect_to @test
  end

  def new
    @question = @test.questions.new
  end

  def show
    render inline: "<p><%= @question.body %></p>"
  end

  def create
    @question = @test.questions.new(test_params)

    if @question.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    @test = @question.test
    if @question.update(test_params)
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

  def test_params
    params.require(:question).permit(:body)
  end
end
