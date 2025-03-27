class Admin::UsersController < AdminController
  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to admin_path, notice: 'User was successfully created.'
    else
      redirect_to admin_path, alert: @user.errors.full_messages.join(", ")
    end
  end

  def destroy
    @user = User.find(params[:id])
    
    if @user == current_user
      redirect_to admin_path, alert: "You cannot delete yourself."
    else
      @user.destroy
      redirect_to admin_path, notice: 'User was successfully deleted.'
    end
  end

  def bulk_delete
    if params[:user_ids].blank?
      redirect_to admin_path, alert: "No users selected."
      return
    end

    # Don't allow deleting yourself
    user_ids = params[:user_ids] - [current_user.id.to_s]
    
    if user_ids.empty?
      redirect_to admin_path, alert: "You cannot delete yourself."
      return
    end

    User.where(id: user_ids).destroy_all
    
    redirect_to admin_path, notice: "Selected users were successfully deleted."
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end
end 