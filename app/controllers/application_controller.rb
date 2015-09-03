class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_account

  around_filter :scope_current_account

  def user_in_account
    unless request.subdomain == current_user.account.subdomain
      redirect_to root_path, alert: "You are not authorized to access that subdomain."
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password,
      :password_confirmation, account_attributes: [:subdomain])}
  end

  def current_account
    @account = Account.find_by(subdomain: request.subdomain)
  end

  def require_account!
    redirect_to root_url if !@account.present?
  end

  def scope_current_account
    Account.current_id = current_account.id if current_account.present?
    yield
  ensure
    Account.current_id = nil
  end


end