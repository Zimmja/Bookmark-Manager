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
    erb(:index)
  end

  post '/add' do
    Bookmark.add(params[:new_name], params[:new_url])
    redirect to('/')
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:'bookmarks/index')
  end

  run! if app_file == $PROGRAM_NAME
end
