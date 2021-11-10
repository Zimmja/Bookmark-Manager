# frozen_string_literal: true

require 'bookmark'

describe BookmarkCollection do
  describe '#self.all' do
    it 'prints the list of bookmarks' do
      bookmarks = BookmarkCollection.all
      expect(bookmarks).to include 'http://www.makersacademy.com'
      expect(bookmarks).to include 'https://www.codewars.com'
      expect(bookmarks).to include 'https://www.reddit.com'
    end
  end

  describe '#self.add' do
    it 'adds a bookmark to the database' do
      BookmarkCollection.add('test_url')
      expect(BookmarkCollection.all).to include 'test_url'
    end
  end
end
