# frozen_string_literal: true

require 'bookmark'

describe BookmarkCollection do
  describe '#self.all' do
    it 'prints the list of bookmarks' do
      setup_database
      bookmarks = BookmarkCollection.all
      expect(bookmarks).to include 'http://www.makersacademy.com'
      expect(bookmarks).to include 'https://www.codewars.com'
      expect(bookmarks).to include 'https://www.reddit.com'
    end
  end
end
