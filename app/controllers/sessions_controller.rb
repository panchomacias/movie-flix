class SessionsController < ApplicationController
  def index
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user, notice: "Welcome back, #{user.name}!"
    else
      flash.now[:alertr] = "Invalid email/password combination"
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to movies_path, notice: "You're looged out!", status: :see_other
  end
end
