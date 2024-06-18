class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user), notice: "User successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "User succesfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
    redirect_to movies_path, status: :see_other,
      alert: "Account successfully deleted"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :username)
  end
end
