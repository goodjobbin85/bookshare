require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret,  'notasecret'
  end

  get '/' do
    erb :'home'
  end

  get '/login' do
    erb :"sessions/login"
  end

  post '/sessions' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/users/#{@user.id}"
    else
      erb :'sessions/login'
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
end
