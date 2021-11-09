# frozen_string_literal: true

# Stores website information, including url
class Bookmark
  attr_reader :name, :url

  def initialize(url, name = 'default')
    @name = name
    @url = url
  end

  def self.all
    connection = PG.connect(dbname: 'bookmark_manager')
    result = connection.exec('SELECT * FROM bookmarks')
    result.map {|bookmark| bookmark['url'] }
  end



end
