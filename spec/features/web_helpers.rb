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

def delete_from_database(deleting_name)
  click_button("Delete #{deleting_name}")
end

def find_in_database(p_id)
  connection = PG.connect(dbname: 'bookmark_manager_test')
  result = connection.query("SELECT * FROM bookmarks WHERE id = #{p_id};")
  result.first
end

def find_in_database_by_name(p_name)
  connection = PG.connect(dbname: 'bookmark_manager_test')
  result = connection.query("SELECT * FROM bookmarks WHERE name = #{p_name};")
  result.first
end

def check_expectations(bmk, name, url)
  bmk_data = find_in_database(bmk.id)
  expect(bmk.id).to eq bmk_data['id']
  expect(bmk_data['name']).to eq name
  expect(bmk_data['url']).to eq url
end
