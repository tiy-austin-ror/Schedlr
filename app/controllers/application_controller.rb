class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def rsvp
    render 'layouts/rsvp.html.erb'
  end


  private

  def user_not_authorized
    flash[:alert] = "Unauthorized action: You must be an admin and cannot create a room for a different company's building."
    redirect_to(request.referrer || root_path)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name << :department
  end

end
