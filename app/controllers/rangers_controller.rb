require 'pry'

class RangersController < ApplicationController

  get '/signup' do
    if ApplicationController.is_logged_in?
      redirect '/bears'
    else
      erb :'/rangers/create_ranger'
    end
  end

  post '/signup' do
    @ranger = Ranger.create(:name => params[:name],
      :username => params[:username],
      :password_digest => params[:password])
    @park = Park.find_by(name: params[:park])
    @ranger.park_id = @park.id
    @ranger.save
    session[:user_id] = @ranger.id
    redirect '/bears'
  end

  get '/login' do
    if ApplicationController.is_logged_in?
     erb :'/rangers/login'
    else
     redirect to '/bears'
   end
  end

  post '/login' do
    @ranger = Ranger.find_by(username: params[:username])
    if @ranger
      session[:user_id] = @ranger.id
      redirect to '/bears'
    else
     redirect to '/login'
    end
  end

  get '/logout' do
    if ApplicationController.is_logged_in?
      session.clear
    end
      redirect '/login'
  end

end
