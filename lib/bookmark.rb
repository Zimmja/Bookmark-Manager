# frozen_string_literal: true

require 'pg'

# Stores website information, including url
class Bookmark
  attr_reader :name, :url

  def initialize(name, url)
    @name = name
    @url = url
  end

  def self.all(result = retrieve_bookmarks)
    result.map { |bm| Bookmark.new(bm['name'], bm['url']) }
  end

  def self.add(name, url)
    connection.exec("INSERT INTO bookmarks (url, name) VALUES ('#{url}', '#{name}') RETURNING url, name")
  end

  def self.retrieve_bookmarks
    connection.exec('SELECT * FROM bookmarks')
  end

  def self.connection
    PG.connect(dbname: "bookmark_manager#{'_test' if ENV['ENVIRONMENT'] == 'test'}")
  end
end