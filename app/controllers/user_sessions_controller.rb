class UserSessionsController < ApplicationController
  def verify
    authentic_user = User.authenticate(user_params[:email], user_params[:password])
    message = if authentic_user.nil?
                { status: 0, message: 'The information you have entered is incorrect, please try again!' }
              else
                { status: 1, message: 'You successfully logged in!' }
              end
    render json: message
  end

  def exists
    username_exists = User.find_by(username: user_params[:username])
    email_exists = User.find_by(email: user_params[:email])
    message = if email_exists
                { status: 1, message: 'Sorry, someone with that email already exists' }
              elsif username_exists
                { status: 0, message: 'Sorry, someone with that username already exists' }
              else
                { status: 2, message: 'Success no one with those credentials exists' }
              end
    render json: message
  end

  private

  def user_params
    params[:user]
  end
end
