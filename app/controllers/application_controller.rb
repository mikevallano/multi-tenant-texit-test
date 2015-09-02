class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_account

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password,
      :password_confirmation, account_attributes: [:subdomain])}
  end

  def set_account
    @account = Account.find_by(subdomain: request.subdomain)
  end

  def require_account!
    redirect_to root_url if !@account.present?
  end


end