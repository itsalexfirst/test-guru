class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:requested_url) || tests_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify Email and Password!'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path, alert: 'Logged out'
  end
end
