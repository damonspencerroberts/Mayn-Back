module UserService
  module Update
    extend self

    def update_age(user, age_param)
      user.update(age: age_param)
    end

    def update_description(user, description_param)
      user.update(description: description_param)
    end

    def update_favorites(user, favorites_param)
      body = create_body_favorites(favorites_param)
      user.update(favorites: body)
    end

    def update_location(user, location_param)
      loc = Geocoder.search(location_param).first.data
      lat = loc['lat']
      lon = loc['lon']
      place_id = loc['place_id']
      display_name = loc['display_name']
      body = create_body_location(lat, lon, place_id, display_name)
      user.update(location: body)
    end

    def create_body_location(lat, lon, place_id, display_name)
      { 
        lat: lat,
        lon: lon,
        place_id: place_id,
        display_name: display_name
      }
    end

    def create_body_favorites(params)
      {
        color: params[:color],
        destination: params[:destination],
        fact: params[:fact],
        alcohol: params[:alcohol],
        socialise: params[:socialise],
        vacation_type: params[:vacation_type],
        movie: params[:movie],
      }
    end
  end
end
