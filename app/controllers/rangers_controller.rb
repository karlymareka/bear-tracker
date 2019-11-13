
class RangersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/bears'
    else
      erb :'/rangers/create_ranger'
    end
  end

  post '/signup' do
    @ranger = Ranger.create(:name => params[:name],
      :username => params[:username],
      :password => params[:password])
    @park = Park.find_by(name: params[:park])
    if @park != nil
      @ranger.park_id = @park.id
    end 

    if @ranger.valid?
      @ranger.save
      session[:user_id] = @ranger.id
      redirect '/bears'
    else
      flash[:message] = "Error: All fields must be entered and username must be unique."
      erb :'/rangers/create_ranger'
    end
  end

  get '/login' do
    if logged_in?
      redirect to '/bears'
    else
      erb :'/rangers/login'
    end
  end

  post '/login' do
    @ranger = Ranger.find_by(username: params[:username])
    if @ranger && @ranger.authenticate(params[:password])
      session[:user_id] = @ranger.id
      redirect to '/bears'
    else
      flash[:message] = "Error: Username and/or password incorrect."
      erb :'/rangers/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      erb :'/rangers/logout'
    else
      redirect '/login'
    end
  end

end
