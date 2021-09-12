module UserService
  module Body
    extend self

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
        movie: params[:movie]
      }
    end
  end
end
