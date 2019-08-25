class RangersController < ApplicationController

  get '/rangers' do
      @rangers = Ranger.all
      erb :'/rangers/index'
  end

  get '/signup' do
      erb :'/rangers/create_ranger'

  end

end
