class BearsController < ApplicationController

  get '/bears' do
    if logged_in?
      @bears = Bear.all
      erb :'/bears/index'
    else
      redirect '/login'
    end 
  end

  get '/bears/new' do
    if logged_in?
      erb :'/bears/new'
    else
      redirect '/login'
    end
  end

  post '/bears' do
    @bear = Bear.create(:name => params[:name],
      :species => params[:species],
      :sex => params[:sex],
      :age => params[:age],
      :health_status => params[:health_status],
      :habituation_status => params[:habituation_status],
      :ranger_id => session[:user_id])
    redirect '/bears'
  end

  get '/bears/:id' do
   if logged_in?
     @bear = Bear.find(params[:id])
     @ranger = Ranger.find(@bear.ranger_id)
     erb :'/bears/show'
   else
    redirect '/login'
   end
 end

   get '/bears/:id/edit' do
     @bear = Bear.find(params[:id])
     if logged_in? && current_user.id == @bear.ranger_id
       erb :'/bears/edit'
     else
       erb :'/bears/error'
     end
   end

  patch '/bears/:id' do
    @bear = Bear.find(params[:id])
    @bear.name = params[:name]
    @bear.species = params[:species]
    @bear.sex = params[:sex]
    @bear.age = params[:age]
    @bear.health_status = params[:health_status]
    @bear.habituation_status = params[:habituation_status]
    @bear.save
    redirect '/bears'
  end

  delete '/bears/:id' do
    @bear = Bear.find(params[:id])
    if logged_in? && current_user.id == @bear.ranger_id
      @bear.delete
      redirect '/bears'
    else
      erb :'/bears/error'
    end
  end

end
