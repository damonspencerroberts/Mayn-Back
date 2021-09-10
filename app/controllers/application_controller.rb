class ApplicationController < ActionController::API
  def render_jsonapi_response(resource)
    if resource.errors.empty?
      render json: { response: resource, status: 200 }
    else
      render json: { error: resource.errors, status: 400 }
    end
  end
end
