require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    @users = User.all
    erb :'/users/index'
  end





  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name], email: params[:email], password: params[:password])
    if @user
      redirect "/users/#{@user.id}"
    else
      erb :'failure'
    end
  end

  get '/users' do
    @users = User.all
    erb :'/users/index'
  end

  get "/users/:id" do
    @user = User.find(params[:id])
    erb :'users/show'
  end

#fix this delete request later
  post '/users/:id' do
    @user = User.find(params[:id])
    @user.delete
    redirect '/users'
  end

end
