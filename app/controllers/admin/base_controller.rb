class Admin::BaseController < ApplicationController

  layout 'admin'

  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: 'You are not authorized to view this page' unless current_user && current_user.admin?
  end

end
