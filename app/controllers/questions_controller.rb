class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :destroy]
  before_action :find_test, only: [:index, :create, :new]

 rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found


  def index
    render inline:
    "<% @test.questions.each do |question| %>
    <p><%= question.body %></p>
    <% end %>"
  end

  def new

  end

  def show
    #result = ["Class: {params.class}, parameters: #{params.inspect}]"]
    #render plain: result.join("\n")
    render inline: "<p><%= @question.body %></p>"
  end

  def create
    question = @test.questions.new(test_params)

    if question.save
      render plain: 'created'
    else
      render :new
    end
  end

  def destroy
    @question.destroy
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

  def rescue_with_question_not_found
    render plain: 'question not found'
  end
end
