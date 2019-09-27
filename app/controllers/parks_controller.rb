class ParksController < ApplicationController

  get '/parks' do
      @parks = Park.all
      @bears = Bear.all 
      erb :'/parks/index'
  end

end
