class SongProviderController < ApplicationController
  require "net/http"

  def index
    @song = Net::HTTP.get_response(URI.parse(build_url(params))).body

    render json: @song
  end

  private

  def build_url(params)
    "https://api.spotify.com/v1/search?q=#{params[:info]}&type=track"
  end
end
