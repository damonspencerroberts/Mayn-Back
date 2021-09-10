class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)
    resource.save
    sign_up(resource_name, resource) if resource.persisted?
    add_identicon(resource)
    render_jsonapi_response(resource)
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :username)
  end

  def add_identicon(user)
    auth = {
      cloud_name: ENV['CLOUDINARY_CLOUD_NAME'],
      api_key: ENV['CLOUDINARY_API_KEY'],
      api_secret: ENV['CLOUDINARY_API_SECRET']
    }
    RubyIdenticon.create_and_save(user.username, 'cloudinary_upload.png')
    response = Cloudinary::Uploader.upload('cloudinary_upload.png', auth)
    url = response['secure_url']
    user.update(avatar: url)
    File.delete('cloudinary_upload.png') if File.exist?('cloudinary_upload.png')
  end
end
