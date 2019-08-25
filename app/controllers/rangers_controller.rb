require 'pry'

class RangersController < ApplicationController

  get '/rangers' do
      @rangers = Ranger.all
      erb :'/rangers/index'
  end

  get '/signup' do
      erb :'/rangers/create_ranger'
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
    erb :'/rangers/login'
  end

  post '/login' do

  end 

end
