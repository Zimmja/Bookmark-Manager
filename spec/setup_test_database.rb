# frozen_string_literal: true

require 'pg'

def setup_test_database
p "setting up test database..."
connection = PG.connect(dbname: 'bookmark_manager_test')
# clearing database table
connection.exec('TRUNCATE bookmarks;')
end
