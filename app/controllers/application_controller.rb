class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :check_auth

  def check_auth
    if current_user and User.user_types[current_user.user_type] != User.user_types['admin'] and ['site_settings', 'apis'].include?(params[:controller])
      flash[:error] = 'You are not authorized to access requested page and been redirected to Home'
      redirect_to authenticated_root_path
    end
  end
end
