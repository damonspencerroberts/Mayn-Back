module UserService
  module Body
    extend self

    def create_body_location(location_params)
      {
        lat: location_params[:lat],
        lon: location_params[:lon],
        city: location_params[:city],
        country: location_params[:country],
        country_code: location_params[:country_code]
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
