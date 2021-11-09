# frozen_string_literal: true

require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?
# http://localhost:4567
# rackup -p 4567

# This is a default class for testing purposes
class Default < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello world!'
  end

  run! if app_file == $PROGRAM_NAME
end
