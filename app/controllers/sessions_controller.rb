class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Login successful"
      redirect_to root_path
    else
      flash[:alert] = "Login failed"
      redirect_to new_session_path
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
