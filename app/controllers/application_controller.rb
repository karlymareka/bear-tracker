require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    register Sinatra::ActiveRecordExtension
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    if logged_in?
      redirect '/bears'
    else
      erb :'/index'
    end 
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      unless session[:user_id] == nil
        Ranger.find(session[:user_id])
      end
    end
  end

end
