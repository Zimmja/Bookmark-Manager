# frozen_string_literal: true

require 'pg'

# Stores website information, including url
class Bookmark
  attr_reader :name, :url, :id

  def initialize(name, url, id)
    @name = name
    @url = url
    @id = id
  end

  def self.all(result = retrieve_bookmarks)
    result.map { |bm| Bookmark.new(bm['name'], bm['url'], bm['id']) }
  end

  def self.add(name, url)
    result = connection.exec_params("INSERT INTO bookmarks (url, name) VALUES ($1, $2) RETURNING id, url, name", [url,name])
    Bookmark.new(result[0]['name'], result[0]['url'], result[0]['id'])
  end

  def self.delete(id)
    connection.exec_params("DELETE FROM bookmarks WHERE id=$1",[id])
  end

  def self.retrieve_bookmarks
    connection.exec('SELECT * FROM bookmarks')
  end

  def self.connection
    PG.connect(dbname: "bookmark_manager#{'_test' if ENV['ENVIRONMENT'] == 'test'}")
  end
end
