# frozen_string_literal: true

describe BookmarkManager do
  feature 'Viewing bookmarks' do
    scenario 'Presents a list of bookmarks to the user' do
      go_to_bookmarks
      expect(page).to have_content 'http://www.twitter.com'
      expect(page).to have_content 'http://www.google.com'
      expect(page).to have_content 'http://www.destroyallsoftware.com'
      expect(page).to have_content 'http://www.youtube.com'
    end
  end
end
