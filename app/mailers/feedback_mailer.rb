class FeedbackMailer < ApplicationMailer
  def feedback(user, body)
    @user = user
    @body = body

    mail to: Admin.pluck(:email)
  end
end
