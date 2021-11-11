# frozen_string_literal: true

require 'pg'

describe BookmarkManager do
  feature 'Viewing bookmarks' do
    scenario 'Presents a list of bookmarks to the user' do
      visit('/')
      %w[Makers Codewars Reddit].each { |url| expect(page).to have_content url }
    end
  end

  feature 'Adding bookmarks' do
    scenario 'Completes a form and adds the entered url to the database' do
      add_to_database('Youtube', 'https://www.youtube.com')
      visit('/')
      expect(page).to have_content 'Youtube'
    end
  end

  feature 'Deleting bookmarks' do
    scenario 'Deletes a given bookmark' do
      visit('/')
      add_to_database('Delsite', 'https://www.delsite.com')
      expect(page).to have_content 'Delsite'
      delete_from_database('Delsite')
      expect(page).not_to have_content 'Delsite'
    end
  end
end
