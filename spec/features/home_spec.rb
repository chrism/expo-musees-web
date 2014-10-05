require 'rails_helper'

RSpec.feature 'Home Page', :vcr do
  background do
     visit root_path
  end

  scenario 'Lists the most recent actualites articles' do
    actualites_links = all '.actualites-list-item'
    expect(actualites_links).to have(3).items
  end
end