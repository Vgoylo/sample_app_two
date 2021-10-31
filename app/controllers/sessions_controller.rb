# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)

    if @user&.authenticate(params[:session][:password])
      log_in @user
      flash[:success] = 'Welcome to the Sample App!'
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
