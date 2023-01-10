class UsersController < ApplicationController

  before_action :require_signin,except: [:new,:create]
  before_action :require_correct_user, only: [:edit,:update,:destroy]

  def index
    @users = User.all
  end

  def show
    @user = set_user
    @reviews = @user.reviews
    @favorite_movies = @user.favorite_movies
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "user created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
      if @user.update(user_params)
        redirect_to @user, notice: "Account has been updated!"
    else
      render :edit
    end

  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to users_path, alert: 'Account has been deleted!'
  end

  private

  def require_correct_user
    @user = set_user
    unless current_user == @user
      redirect_to root_url
    end
  end

  def set_user
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:username)
  end


end
