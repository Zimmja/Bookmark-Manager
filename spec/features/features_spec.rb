# frozen_string_literal: true
require 'pg'

describe BookmarkManager do
  #let(:test_bookmarks) { open_test_bookmarks }

  feature 'Viewing bookmarks' do
    scenario 'Presents a list of bookmarks to the user' do
      setup_database


      go_to_bookmarks
      expect(page).to have_content 'http://www.makersacademy.com'
      expect(page).to have_content 'https://www.codewars.com'
      expect(page).to have_content 'https://www.reddit.com'
    end
  end
end
