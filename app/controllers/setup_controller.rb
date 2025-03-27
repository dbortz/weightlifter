class SetupController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :ensure_no_users_exist

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params.merge(role: :admin))
    
    if @user.save
      sign_in(@user)
      redirect_to root_path, notice: 'Admin account created successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def ensure_no_users_exist
    redirect_to root_path if User.exists?
  end
end 