class Admin::UserRolesController < ApplicationController
#   before_action :authenticate_admin!
before_action :load_user, only: [:edit, :update]

# Define this method
  load_and_authorize_resource class: 'User'
  
  def index
    @users = User.all
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_roles_path, notice: 'User role updated successfully.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end


  def load_user
    @user = User.find(params[:id])
  end
end
