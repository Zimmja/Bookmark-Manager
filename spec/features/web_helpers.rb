# frozen_string_literal: true

def go_to_bookmarks
  visit('/')
  click_link('View bookmarks')
end

def setup_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO bookmarks (url) values('http://www.makersacademy.com');")
  connection.exec("INSERT INTO bookmarks (url) values('https://www.codewars.com');")
  connection.exec("INSERT INTO bookmarks (url) values('https://www.reddit.com');")
end
