class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_language
  
  private
  def set_language
    session[:locale] = params[:locale] if params[:locale]
    
    I18n.locale = session[:locale] || "en"
  end
end
