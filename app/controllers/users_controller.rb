class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def show

  end

  def destroy
    @user.destroy
    redirect_to articles_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome #{@user.username} to the Alpha Blog!"
      redirect_to articles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    #@user = User.find(params[:id])
  end

  def update
    #@user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User data updated!"
      redirect_to articles_path
    else
      render :edit, status: :unprocessable_entity
    end

  end
  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
