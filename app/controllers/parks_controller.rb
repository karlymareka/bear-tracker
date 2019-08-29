class ParksController < ApplicationController

  get '/parks' do
      @parks = Park.all
      erb :'/parks/index'
  end

end
