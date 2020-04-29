class TestPassagesController < ApplicationController

  before_action :find_test_passage, only: %i[show result update gist]

  def show
    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      success! if @test_passage.success?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    gist_question_service = GistQuestionService.new(@test_passage.current_question)
    result = gist_question_service.call

    flash_options = if gist_question_service.success?
      save_gist(result.html_url)
      { notice: t('.success', gist_link: view_context.link_to('gist', result.html_url)) }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def save_gist(gist_url)
    current_user.gists.create(question: @test_passage.current_question, gist_url: gist_url)
  end

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def success!
    @test_passage.update_attribute(:success, true)
    BadgeService.new(@test_passage).call
  end
end
