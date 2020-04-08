require 'pry'

class UsersController < ApplicationController

  get '/users' do
    @users = User.all
    erb :'users/index'
  end

  get '/users/new' do
      erb :'users/new'
  end

  post '/users' do
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.save
    session[:user_id] = @user.id
    redirect to "/users/#{@user.id}"
  end

  get "/users/:id" do
    if !logged_in?
      redirect '/login'
    else
      @user = User.find(params[:id])
      erb :'users/show'
    end
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

    redirect to "/users/#{@user.id}"
  end

  #fix this delete request later
    delete '/users/:id' do
      @user = User.find(params[:id])
      @user.delete
      redirect '/users'
    end

    post '/add_book' do
      @book = Book.new
      @book.user = @user
      @book.title = params[:title]
      @book.author = params[:author]
      @book.year_published = params[:year_published]
      @book.condition = params[:condition]
      @book.save
      redirect to "/books/#{@book.id}"
    end
end
