# frozen_string_literal: true

require 'pg'

# Stores website information, including url
class Bookmark
  attr_reader :name, :url

  def initialize(url, name = 'default')
    @name = name
    @url = url
  end

  def self.all(result = connect_bookmarks)
    result.map { |bookmark| bookmark['url'] }
  end

  def self.connect_bookmarks
    connection = ""
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec('SELECT * FROM bookmarks')
  end
end
