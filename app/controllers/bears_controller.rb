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
    if @bear.valid?
      @bear.park_id = Ranger.find(@bear.ranger_id).park.id
      @bear.save
      redirect '/bears'
    else
      flash[:message] = "Error: All fields except age must be completed to create a bear."
      redirect to '/bears/new'
    end
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
       flash[:message] = "Error: Rangers may only edit or delete their own bears."
       redirect '/bears'
     end
   end

  patch '/bears/:id' do
    @bear = Bear.find(params[:id])
    if logged_in? && current_user.id == @bear.ranger_id
      @bear.name = params[:name]
      @bear.species = params[:species]
      @bear.sex = params[:sex]
      @bear.age = params[:age]
      @bear.health_status = params[:health_status]
      @bear.habituation_status = params[:habituation_status]
      @bear.save
      redirect '/bears'
    else
      flash[:message] = "Error: Rangers may only edit or delete their own bears."
      redirect '/bears'
    end
  end

  delete '/bears/:id' do
    @bear = Bear.find(params[:id])
    if logged_in? && current_user.id == @bear.ranger_id
      @bear.delete
    else
       flash[:message] = "Error: Rangers may only edit or delete their own bears."
    end
    redirect '/bears'
  end

end
