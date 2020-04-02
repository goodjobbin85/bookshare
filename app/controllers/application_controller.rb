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

  get '/users' do
    @users = User.all
    erb :'/users/index'
  end

  post '/users' do
    @user = User.create(name: params[:name], email: params[:email], password: params[:password])
    if @user
      redirect "/users/#{@user.id}"
    else
      erb :'failure'
    end
  end

  get '/users/new' do
    erb :'users/new'
  end



  get "/users/:id" do
    @user = User.find(params[:id])
    erb :'users/show'
  end

  #fix this delete request later
    delete '/users/:id' do
      @user = User.find(params[:id])
      @user.delete
      redirect '/users'
    end

  get "/users/:id/edit" do
    @user = User.find(params[:id])
    erb :'users/edit'
  end

  patch "/users/:id" do
    @user = User.find(params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.save
    redirect "/users/#{params[:id]}"
  end



end
