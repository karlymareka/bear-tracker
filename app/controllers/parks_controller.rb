class ParksController < ApplicationController

  get '/parks' do
      @parks = Bear.all
      erb :'/parks/index'
  end

end 
