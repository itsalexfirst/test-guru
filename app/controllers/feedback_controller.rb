class FeedbackController < ApplicationController

  def new; end

  def create
    FeedbackMailer.feedback(current_user, params[:body]).deliver_now
    redirect_to root_path, notice: t('.success')
  end
end
