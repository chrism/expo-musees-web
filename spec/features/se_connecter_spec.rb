require 'rails_helper'

RSpec.feature 'Se Connecter Page', :vcr do
  background do
     visit se_connecter_path
  end

  scenario 'Correct email & password shows success message' do
    puts "here we are ... #{ENV['USERNAME']}"
    fill_in 'Email', :with => ENV['USERNAME']
    fill_in 'Password', :with => ENV['PASSWORD']

    click_button 'Sign in'
    expect(page).to have_content 'Signed in!'
  end

  scenario 'Incorrect email & password shows success message' do
    fill_in 'Email', :with => ENV['USERNAME']
    fill_in 'Password', :with => 'password'

    click_button 'Sign in'
    expect(page).to have_content 'There was a problem signing in'
  end
end