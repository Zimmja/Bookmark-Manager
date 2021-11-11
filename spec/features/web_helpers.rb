# frozen_string_literal: true

def go_to_bookmarks
  visit('/')
  click_link('View bookmarks')
end

def add_to_database(adding_name, adding_url)
  visit('/')
  fill_in('new_name', with: adding_name)
  fill_in('new_url', with: adding_url)
  click_button('Add to database')
end
