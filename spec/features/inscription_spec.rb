require 'rails_helper'


RSpec.feature 'Inscription Page', :vcr do
  background do
     visit inscription_path
  end

  scenario 'Correct details email & password shows success message' do
    fill_in 'Firstname', :with => Faker::Name.first_name
    fill_in 'Lastname', :with => Faker::Name.last_name
    fill_in 'Email', :with => Faker::Internet.email
    fill_in 'Password', :with => Faker::Internet.password(8)

    click_button 'Sign up'
    expect(page).to have_content 'Thank you for signing up!'
    expect(page).to have_content 'You should receive shortly an email with a confirmation link, please check you email - including your spam folder'
  end

  scenario 'Missing details shows form error message' do
    fill_in 'Firstname', :with => ''
    fill_in 'Lastname', :with => ''
    fill_in 'Email', :with => ''
    fill_in 'Password', :with => ''

    click_button 'Sign up'
    expect(page).to have_content 'Sorry, there is a problem with the form'
  end

  scenario 'Existing user shows error message' do
    fill_in 'Firstname', :with => ENV['FIRSTNAME']
    fill_in 'Lastname', :with => ENV['LASTNAME']
    fill_in 'Email', :with => ENV['USERNAME']
    fill_in 'Password', :with => ENV['PASSWORD']

    click_button 'Sign up'
    expect(page).to have_content 'A user already exists with that email address'
  end

end