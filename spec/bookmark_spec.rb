# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  describe '#self.all' do
    it 'prints the list of bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks.first.name).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '#self.add' do
    it 'adds a bookmark to the database' do
      Bookmark.add('Netflix', 'https://www.netflix.com/')
      expect(Bookmark.all.last.name).to eq 'Netflix'
    end
  end
end
