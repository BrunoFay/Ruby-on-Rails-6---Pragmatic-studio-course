class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = set_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "user created successfully!"
    else
      render :new
    end
  end

  def edit
    @user = set_user
  end

  def update
    @user = set_user

      if @user.update(user_params)
        redirect_to @user, notice: "Account has been updated!"
    else
      render :edit
    end

  end

  def destroy
    @user = set_user
    @user.destroy
    redirect_to users_path, alert: 'Account has been deleted!'
  end

  private

  def set_user
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:username)
  end


end
