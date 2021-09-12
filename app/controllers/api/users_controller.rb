class Api::UsersController < Api::BaseController
  before_action :find_user, only: [:show]

  def show
    render_jsonapi_response(@user)
  end

  def update_age
    UserService::Update.update_age(find_user, user_params[:age])
    render json: { status: 1, message: "Successfully updated #{find_user.username}'s age." }
  rescue StandardError => e
    render json: { status: 0, message: 'Error updating age.', error: e }
  end

  def update_description
    UserService::Update.update_description(find_user, user_params[:description])
    render json: { status: 1, message: "Successfully updated #{find_user.username}'s description." }
  rescue StandardError => e
    render json: { status: 0, message: 'Error updating age.', error: e }
  end

  def update_favorites
    
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:age, :id, :description)
  end
end
