require './config/environment'

class BooksController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/books' do
    @books = Book.all
    erb :'books/index'
  end

  get '/books/new' do
    erb :'books/new'
  end

  get '/books/:id' do
    @book = Book.find(params[:id])
    erb :'books/show'
  end

  post '/books' do
    @book = Book.new
    @book.title = params[:title]
    @book.author = params[:author]
    @book.year_published = params[:year_published]
    @book.condition = params[:condition]
    @book.save
    redirect to "/books/#{@book.id}"
  end

  get '/books/:id/edit' do
    @book = Book.find(params[:id])
    erb :'books/edit'
  end

  patch '/books/:id' do
    @book = Book.find(params[:id])
    @book.title = params[:title]
    @book.author = params[:author]
    @book.year_published = params[:year_published]
    @book.condition = params[:condition]
    @book.save
    redirect to "/books/#{@book.id}"
  end

  delete '/books/:id' do
    @book = Book.find(params[:id])
    @book.destroy
    redirect '/books'
  end













end
