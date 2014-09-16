require 'rails_helper'

RSpec.feature 'Actualites Page', :vcr do
  background do
     visit actualites_path
  end

  scenario 'Lists the most recent actualites articles' do
    actualites_links = all '.actualites-list-item'
    expect(actualites_links).to have(10).items
  end

  scenario 'List item links to detail page' do
    title = first('.actualites-list-item > a').text
    first('.actualites-list-item > a').click
    expect(first 'h1').to have_content(/[^\s]/)
    expect(first 'h2').to have_content(/[^\s]/)
    expect(first '.content').to have_content(/[^\s]/)
  end
end