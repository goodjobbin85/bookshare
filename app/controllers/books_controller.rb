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

  get '/books/:id' do
    @book = Book.find(params[:id])
    erb :'books/show'
  end
end
