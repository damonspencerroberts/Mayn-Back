module UserService
  module Update
    extend self

    def update_age(user, age_param)
      user.update(age: age_param.to_i)
    end

    def update_description(user, description_param)
      user.update(description: description_param)
    end

    def update_favorites(user, favorites_param)
      body = UserService::Body.create_body_favorites(favorites_param)
      user.update(favorites: body)
    end

    def update_location(user, location_params)
      body = UserService::Body.create_body_location(location_params)
      user.update(location: body)
    end

    def update_avatar(user, avatar_param)
      user.update(avatar: avatar_param)
    end
  end
end
