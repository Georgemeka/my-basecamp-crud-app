class UsersController < ApplicationController

    before_action :authenticate_user!
 before_action :authorized_user, only: [:admin, :remove]


  def index
    @users = User.all
  end


  def show
    @user = User.find(params[:id])
  end

  def admin
    user = User.find params[:id]
    user.update( :admin => true)
    redirect_to users_path
  end



  def authorized_user
    @k = current_user.admin
    redirect_to users_path, alert: "NOT AUTHORIZED!! Only an admin can do this" if @k==false
  end


end
