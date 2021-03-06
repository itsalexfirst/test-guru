class ApplicationController < ActionController::Base

  before_action :set_locale
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    I18n.locale == I18n.default_locale ? {} :{ lang: I18n.locale }
  end

  def after_sign_in_path_for(user)
    user.admin? ? admin_tests_path : root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys:[:name, :email, :password, :password_confirmation, :current_password])
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
