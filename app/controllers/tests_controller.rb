class TestsController < ApplicationController
  before_action :find_test, only: [:show]

  def index
    #result = ["Class: {params.class}, parameters: #{params.inspect}]"]
    #render plain: result.join("\n")
    render inline:
    "<% Test.all.each do |test| %>
    <p><%= test.title %>
    </p><% end %>"
  end

  def show
    render inline:
    "<p><%= @test.title %></p>
    <% @test.questions.each do |question| %>
    <p><%= question.body %></p>
    <% end %>"
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
