require 'rails_helper'

RSpec.feature 'Se Connecter Page', :vcr do
  background do
     visit se_connecter_path
  end

  scenario 'Correct email & password shows success message' do
    fill_in 'Email', :with => 'chris'
    fill_in 'Password', :with => 'password'

    click_button 'Sign in'
    expect(page).to have_content 'Signed in!'
  end

  scenario 'Incorrect email & password shows success message' do
    fill_in 'Email', :with => 'jon'
    fill_in 'Password', :with => 'password'

    click_button 'Sign in'
    expect(page).to have_content 'Could not sign in'
  end
end