class BearsController < ApplicationController

  get '/bears' do
      @bears = Bear.all
      erb :'/bears/index'
  end

  get '/bears/new' do
    if session[user_id] == nil
      redirect to '/login'
    else
      erb :'/bears/new'
    end 
  end

  post '/bears/new' do
    @bear = Bear.create(:name => params[:name],
      :sex => params[:sex],
      :age => params[:age],
      :health_status => params[:health_status],
      :habituation_status => params[:habituation_status],
      :ranger_id => session[user_id])
  end

end
