require 'rails_helper'

RSpec.feature 'Actualites Page', :vcr, record: :all do
  background do
     visit actualites_path
  end

  scenario 'Lists the most recent actualites articles' do
    actualites_links = all '.recent-actualites-list-item'
    expect(actualites_links).to have(10).items
  end
end