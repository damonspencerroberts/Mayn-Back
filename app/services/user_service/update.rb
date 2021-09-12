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
      return body
    end

    def update_location(user, location_param)
      loc = Geocoder.search(location_param).first.data
      lat = loc['lat']
      lon = loc['lon']
      place_id = loc['place_id']
      display_name = loc['display_name']
      body = UserService::Body.create_body_location(lat, lon, place_id, display_name)
      user.update(location: body)
    end

    def update_avatar(user, avatar_param)
      user.update(avatar: avatar_param)
    end
  end
end
