class SongProviderController < ApplicationController
  require "net/http"
  
  def index
    @song = Net::HTTP.get_response(URI.parse(build_url(params))).body
    
    render json: @song
  end
  
  private
  def build_url(params)
    "http://www.tinysong.com/b/#{params[:info]}?format=json&key=931a76acc7124bea6b91b3b40cb25d58"
  end
end
