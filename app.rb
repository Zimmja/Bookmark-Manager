# frozen_string_literal: true

require './lib/bookmark'
require 'pg'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?
# http://localhost:4567
# rackup -p 4567

# This is a default class for testing purposes
class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @bookmarks = Bookmark.all
    erb(:index)
  end

  post '/add' do
    Bookmark.add(params[:new_name], params[:new_url])
    redirect to('/')
  end

  post '/update' do
    Bookmark.update(params[:bmk_id], params[:bmk_name], params[:bmk_url])
    redirect to('/')
  end

  post '/delete' do
    Bookmark.delete(params[:delete_param])
    redirect to('/')
  end

  post '/update_bmk' do
    redirect to("/update_bmk?id=#{params[:update_param]}")
  end

  get '/update_bmk' do
    @bookmark = params[:id]
    erb(:'update/index')
  end

  run! if app_file == $PROGRAM_NAME
end
