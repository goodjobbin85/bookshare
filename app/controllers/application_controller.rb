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

  get '/users/new' do
    erb :'users/new'
  end

  get "/users/:id" do
    @user = User.find(params[:id])
    erb :'users/show'
  end


  post '/users' do
    @user = User.create(name: params[:name], email: params[:email], password: params[:password])
    if @user
      redirect to :"/users/#{@user.id}"
    else
      erb :'failure'
    end
  end

end
