class ApplicationController < ActionController::Base
  # Need to be a login user to use the app
  before_action :authenticate_user!
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end

end
