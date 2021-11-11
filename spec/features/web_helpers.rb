# frozen_string_literal: true

require 'pg'

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

def find_in_database(p_id)
  connection = PG.connect(dbname: 'bookmark_manager_test')
  result = connection.query("SELECT * FROM bookmarks WHERE id = #{p_id};")
  result.first
end
