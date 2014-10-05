require 'rails_helper'


RSpec.feature 'Profile Page', :vcr do
  background do
    visit se_connecter_path
    fill_in 'Email', :with => ENV['USERNAME']
    fill_in 'Password', :with => ENV['PASSWORD']
    click_button 'Sign in'
  end

  scenario 'Shows user information' do
    click_link('Profile')
    name = [ENV['FIRSTNAME'], ENV['LASTNAME']].join(" ")
    expect(page).to have_content name
  end
end