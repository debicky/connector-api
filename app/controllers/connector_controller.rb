class ConnectorController < ApplicationController
  def index
    api = HTTP.auth("Bearer #{ Rails.application.credentials.dig(:gist, :api_key) }").get("https://api.getgist.com/contacts")
    @response = JSON.parse(api)['contacts']
    render :json => MultiJson.dump(@response.map { |i| i.compact}, only: ["id", "first_name", "last_name", "full_name", "email"] )
  end
end

