# frozen_string_literal: true

require 'pg'

describe BookmarkManager do
  feature 'Viewing bookmarks' do
    scenario 'Presents a list of bookmarks to the user' do
      go_to_bookmarks
      %w[Makers Codewars Reddit].each { |url| expect(page).to have_content url }
    end
  end

  feature 'Adding bookmarks' do
    scenario 'Completes a form and adds the entered url to the database' do
      add_to_database('Youtube', 'https://www.youtube.com')
      go_to_bookmarks
      expect(page).to have_content 'Youtube'
    end
  end
end
