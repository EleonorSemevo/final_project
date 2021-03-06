class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  # before_action :login_required
  before_action :current_user
  private
  def login_required
    redirect_to new_session_path unless current_user
  end



  def set_admin_locale
    I18n.locale = :fr
  end


end
