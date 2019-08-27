require 'pry'

class RangersController < ApplicationController

  get '/rangers' do
      @rangers = Ranger.all
      erb :'/rangers/index'
  end

  get '/signup' do
    if session[:user_id] == nil
      erb :'/rangers/create_ranger'
    else
      redirect '/bears'
    end
  end

  post '/signup' do
    @ranger = Ranger.create(:name => params[:name],
      :username => params[:username],
      :password_digest => params[:password])
    @park = Park.find_by(name: params[:park])
    @ranger.park_id = @park.id
    session[:user_id] = @ranger.id
    redirect '/bears'
  end

  get '/login' do
    if session[:user_id] == nil
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
    if session[:user_id] != nil
      session.clear
    end
      redirect '/login'
  end

end
