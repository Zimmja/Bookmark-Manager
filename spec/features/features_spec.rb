# frozen_string_literal: true

describe BookmarkManager do
  feature 'Viewing bookmarks' do
    scenario 'Presents a list of bookmarks to the user' do
      go_to_bookmarks
      expect(page).to have_content 'Reddit: https://www.reddit.com/'
      expect(page).to have_content 'Codewars: https://www.codewars.com/'
      expect(page).to have_content 'Github: https://github.com/'
    end
  end
end
