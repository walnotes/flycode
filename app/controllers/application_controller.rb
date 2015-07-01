class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end

  private
  def render_404
    render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
  end
end
