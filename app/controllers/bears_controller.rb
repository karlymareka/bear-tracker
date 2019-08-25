class BearsController < ApplicationController

  get '/bears' do
      @bears = Bear.all
      erb :'/bears/index'
  end

  get '/bears/new' do
    erb :'/bears/new'
  end

end
