class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)
    resource.save
    sign_up(resource_name, resource) if resource.persisted?
    if resource.errors.empty?
      render json: { response: resource, status: 200 }
    else
      render json: { error: resource.errors, status: 400 }
    end
  end

  private

  def sign_up_params
    params.require(:registration).permit(:email, :password)
  end
end
