class UserSessionsController < ApplicationController
  def verify
    user_params = params[:user]
    authentic_user = User.authenticate(user_params[:email], user_params[:password])
    message = if authentic_user.nil?
                { status: 0, message: 'The information you have entered is incorrect, please try again!' }
              else
                { status: 1, message: 'You successfully logged in!' }
              end
    render json: message
  end
end
