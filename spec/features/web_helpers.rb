# frozen_string_literal: true

def go_to_bookmarks
  visit('/')
  click_link('View bookmarks')
end

def open_test_bookmarks
  (PG.connect(dbname: 'bookmark_manager')).exec('SELECT * FROM bookmarks')
end
