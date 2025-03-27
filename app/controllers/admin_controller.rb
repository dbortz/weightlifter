class AdminController < ApplicationController
  before_action :ensure_admin

  def index
  end

  private

  def ensure_admin
    unless current_user&.admin?
      redirect_to root_path, alert: "You are not authorized to access this area."
    end
  end
end 