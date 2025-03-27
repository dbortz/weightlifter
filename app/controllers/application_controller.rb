class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :authenticate_user!
  before_action :check_setup_needed

  private

  def check_setup_needed
    return if controller_name == 'setup'
    redirect_to setup_path unless User.exists?
  end
end
