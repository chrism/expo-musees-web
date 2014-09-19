require 'rails_helper'

RSpec.feature 'Musees Page', :vcr do
  background do
     visit musees_path
  end

  scenario 'Lists the most recent musees' do
    musees_links = all '.musees-list-item'
    expect(musees_links).to have(10).items
    count = first('.total-count').text
    expect(count).to have_content(/[0-9|\.]+/)
  end

  scenario 'List item links to detail page' do
    title = first('.musees-list-item > a').text
    first('.musees-list-item > a').click
    expect(first 'h1').to have_content(/[^\s]/)
    expect(first 'h2').to have_content(/[^\s]/)
    expect(first '.content').to have_content(/[^\s]/)
  end

  scenario 'pagination goes to page 2' do 
    first('a[rel="next"]').click
    expect(first '.page.current').to have_content('2')
  end
end