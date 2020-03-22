class TestsController < ApplicationController
  #before_action :find_test, only: [:show]

  def index
    @tests = Test.all
  end

  def show
    @test = find_test
  end

  private

  def find_test
    Test.find(params[:id])
  end
end
