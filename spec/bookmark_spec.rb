# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  describe '#.all' do
    it 'prints the list of bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks.first.name).to eq 'Makers'
    end
  end

  before(:each) { @bmk = Bookmark.add('Netflix', 'https://www.netflix.com') }

  describe '#.add' do
    it 'adds a bookmark to the database' do
      # netflix_bm = Bookmark.add('Netflix', 'https://www.netflix.com')
      expect(@bmk.url).to eq find_in_database(@bmk.id)['url']
    end
  end

  describe '#.delete' do
    it 'removes a bookmark from the database' do
      # website_bm = Bookmark.add('Netflix', 'https://www.netflix.com')
      expect { Bookmark.delete(@bmk.id) }.to change { Bookmark.all.count }.by(-1)
    end
  end

  describe '#.update' do
    it 'updates bookmark information' do
      # ts_bm = Bookmark.add('Netflix', 'https://www.netflix..com')
      Bookmark.update(@bmk.id, 'Newsite', 'https://www.newsite.com')
      check_expectations(@bmk, 'Newsite', 'https://www.newsite.com')
    end
  end
end
