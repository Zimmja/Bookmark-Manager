# frozen_string_literal: true

require 'pg'

# Stores website information, including url
class BookmarkCollection
  def self.all(result = retrieve_bookmarks)
    result.map { |bookmark| bookmark['url'] }
  end

  def self.add(url)
    connection.exec("INSERT INTO bookmarks (url) values('#{url}')")
  end

  def self.retrieve_bookmarks
    connection.exec('SELECT * FROM bookmarks')
  end

  def self.connection
    PG.connect(dbname: "bookmark_manager#{'_test' if ENV['ENVIRONMENT'] == 'test'}")
  end
end
