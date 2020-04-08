require './config/environment'
require 'pry'

class BooksController < ApplicationController

  get '/books' do
    @books = Book.all
    erb :'books/index'
  end

  get '/books/new' do
    redirect '/'
#    erb :'books/new'
  end

  get '/books/:id' do
    @book = Book.find(params[:id])
    erb :'books/show'
  end

  post '/books' do
    session[:user_id]
    @book = Book.new
    @book.user_id = session[:user_id]
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

  helpers do
    def self.check_status
        if self.status == nil?
          Checkout
        else
          Not Available
        end
    end
  end











end
