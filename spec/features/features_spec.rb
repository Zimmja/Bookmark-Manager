# frozen_string_literal: true
require 'pg'
describe BookmarkManager do
  #let(:test_bookmarks) { open_test_bookmarks }

  feature 'Viewing bookmarks' do
    scenario 'Presents a list of bookmarks to the user' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) values('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) values('https://www.codewars.com');")
      connection.exec("INSERT INTO bookmarks (url) values('https://www.reddit.com');")

      go_to_bookmarks
      expect(page).to have_content 'http://www.makersacademy.com'
      expect(page).to have_content 'https://www.codewars.com'
      expect(page).to have_content 'https://www.reddit.com'
    end
  end
end
