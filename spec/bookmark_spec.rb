# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  let(:bookmark) { Bookmark.new(:url, :name) }

  it 'initializes with a name and a url' do
    expect(bookmark.name).to eq :name
    expect(bookmark.url).to eq :url
  end

  describe '#self.all' do
    it 'prints the list of bookmarks' do
      setup_database
      bookmarks = Bookmark.all #([{ 'url' => 'double' }])
      expect(bookmarks).to include 'http://www.makersacademy.com'
      expect(bookmarks).to include 'https://www.codewars.com'
      expect(bookmarks).to include 'https://www.reddit.com'
    end
  end
end
