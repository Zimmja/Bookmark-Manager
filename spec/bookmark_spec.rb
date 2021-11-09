# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  let(:bookmark) { Bookmark.new(:name, :url) }

  it 'initializes with a name and a url' do
    expect(bookmark.name).to eq :name
    expect(bookmark.url).to eq :url
  end
end
