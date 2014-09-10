require 'rails_helper'

RSpec.feature 'Actualites Page', :type => :feature do
  background do
    visit root_path
  end

  scenario 'Lists the most recent actualites articles' do
    actualites_links = all '.recent-actualites-list-item'
    expect(actualites_links).to_not be_empty
  end
end