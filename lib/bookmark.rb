# frozen_string_literal: true

# Stores website information, including url
class Bookmark
  attr_reader :name, :url

  def initialize(name, url)
    @name = name
    @url = url
  end
end
