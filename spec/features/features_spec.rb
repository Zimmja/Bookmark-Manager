# frozen_string_literal: true

describe BookmarkManager do
  let(:test_bookmarks) { open_test_bookmarks }

  feature 'Viewing bookmarks' do
    scenario 'Presents a list of bookmarks to the user' do
      go_to_bookmarks
      expect(page).to have_content 'http://www.makersacademy.com'
    end
  end
end
