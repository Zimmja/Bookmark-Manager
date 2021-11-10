# frozen_string_literal: true

require 'pg'

describe BookmarkManager do
  feature 'Viewing bookmarks' do
    scenario 'Presents a list of bookmarks to the user' do
      go_to_bookmarks
      ['http://www.makersacademy.com',
       'https://www.codewars.com',
       'https://www.reddit.com'].each { |url| expect(page).to have_content url }
    end
  end

  feature 'Adding bookmarks' do
    scenario 'Completes a form and adds the entered url to the database' do
      add_to_database('https://www.youtube.com')
      go_to_bookmarks
      expect(page).to have_content 'https://www.youtube.com'
    end
  end
end
