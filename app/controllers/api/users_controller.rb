class Api::UsersController < Api::BaseController
  before_action :find_user, only: [:show]

  def show
    render_jsonapi_response(@user)
  end

  def update_age
    UserService::Update.update_age(find_user, user_params[:age])
    render json: { status: 1, message: "Successfully updated #{find_user.username}'s age.", user: find_user }
  rescue StandardError => e
    render json: { status: 0, message: 'Error updating age.', error: e }
  end

  def update_description
    UserService::Update.update_description(find_user, user_params[:description])
    render json: { status: 1, message: "Successfully updated #{find_user.username}'s description.", user: find_user }
  rescue StandardError => e
    render json: { status: 0, message: 'Error updating description.', error: e }
  end

  def update_favorites
    body = UserService::Update.update_favorites(find_user, favorites_params)
    render json: { status: 1, message: "Successfully updated #{find_user.username}'s favorites.", user: find_user, body: body }
  rescue StandardError => e
    render json: { status: 0, message: 'Error updating favorites.', error: e }
  end

  def update_location
    UserService::Update.update_location(find_user, user_params[:location])
    render json: { status: 1, message: "Successfully updated #{find_user.username}'s location.", user: find_user }
  rescue StandardError => e
    render json: { status: 0, message: 'Error updating location.', error: e }
  end
  
  def update_avatar
    UserService::Update.update_avatar(find_user, user_params[:avatar])
    render json: { status: 1, message: "Successfully updated #{find_user.username}'s avatar.", user: find_user }
  rescue StandardError => e
    render json: { status: 0, message: 'Error updating location.', error: e }
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:age, :id, :description, :favorites, :location, :avatar)
  end

  def favorites_params
    params.permit(:color, :destination, :fact, :alcohol, :socialise, :vacation_type, :movie)
  end
end
