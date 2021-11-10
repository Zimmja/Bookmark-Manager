# frozen_string_literal: true

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
    (PG.connect(dbname: 'bookmark_manager')).exec('SELECT * FROM bookmarks')
  end
end
