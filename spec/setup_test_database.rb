# frozen_string_literal: true

require 'pg'

def setup_test_database
  p 'setting up test database...'
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec('TRUNCATE bookmarks;')
  connection.exec("INSERT INTO bookmarks (url) values('http://www.makersacademy.com');")
  connection.exec("INSERT INTO bookmarks (url) values('https://www.codewars.com');")
  connection.exec("INSERT INTO bookmarks (url) values('https://www.reddit.com');")
end
