require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :'/index'
  end

  def self.current_user
    Ranger.find(session[:user_id])
  end

  def self.is_logged_in?
    if session[:user_id] != nil
      true
    else
      false
    end
  end

end
