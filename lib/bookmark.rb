# frozen_string_literal: true

require 'pg'

# Stores website information, including url
class BookmarkCollection
  def self.all(result = connect_bookmarks)
    result.map { |bookmark| bookmark['url'] }
  end

  def self.connect_bookmarks
    connection = PG.connect(dbname: "bookmark_manager#{'_test' if ENV['ENVIRONMENT'] == 'test'}")
    connection.exec('SELECT * FROM bookmarks')
  end
end

