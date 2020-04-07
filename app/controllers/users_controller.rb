require 'pry'

class UsersController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/users' do
    @users = User.all
    erb :'users/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  get "/users/:id" do
    @user = User.find(params[:id])
    erb :'users/show'
  end

  post '/users' do
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    session[:user_id] = @user.id
    @user.save
    redirect to "/users/#{@user.id}"
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
      @book.user = @user.id
      @book.title = params[:title]
      @book.author = params[:author]
      @book.year_published = params[:year_published]
      @book.condition = params[:condition]
      @book.save
      redirect to "/books/#{@book.id}"
    end
end
