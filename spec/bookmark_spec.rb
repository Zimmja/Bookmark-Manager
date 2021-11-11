# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  describe '#.all' do
    it 'prints the list of bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks.first.name).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '#.add' do
    it 'adds a bookmark to the database' do
      netflix_bm = Bookmark.add('Netflix', 'https://www.netflix.com')
      netflix_bm_data = find_in_database(netflix_bm.id)

      expect(netflix_bm.name).to eq 'Netflix'
      expect(netflix_bm.url).to eq 'https://www.netflix.com'
      expect(netflix_bm.id).to eq netflix_bm_data['id']
    end
  end

  describe '#.delete' do
    it 'removes a bookmark from the database' do
      website_bm = Bookmark.add('Website', 'https://www.website.com')
      website_bm_data = find_in_database(website_bm.id)

      expect(website_bm.id).to eq website_bm_data['id']
      expect { Bookmark.delete(website_bm.id) }.to change { Bookmark.all.count }.by(-1)
    end
  end
end
