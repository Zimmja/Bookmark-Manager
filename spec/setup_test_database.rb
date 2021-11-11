# frozen_string_literal: true

require 'pg'

def setup_test_database
  p 'setting up test database...'
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec('TRUNCATE bookmarks;')
  connection.exec("INSERT INTO bookmarks (url, name) values('http://www.makersacademy.com','Makers');")
  connection.exec("INSERT INTO bookmarks (url, name) values('https://www.codewars.com','Codewars');")
  connection.exec("INSERT INTO bookmarks (url, name) values('https://www.reddit.com','Reddit');")
end
