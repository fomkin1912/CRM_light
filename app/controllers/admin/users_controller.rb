class Admin::UsersController < ApplicationController

  def index
    @users = User.order(sort_clause)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.build_address
    if @user.save
      redirect_to users_path, nostice: 'User was created.'
    else
      render 'new'
    end

  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: 'User was updated.'
    else
      render 'edit'
    end

  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy

  	redirect_to users_path, notice: 'User was destroyed.'
  end  

  protected

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :mid_name, :last_name, :admin, :department_id, :position_id, address_attributes: [:id, :street])
  end

end