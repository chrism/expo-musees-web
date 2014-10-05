require 'rails_helper'

RSpec.feature 'Se Connecter Page', :vcr do
  background do
     visit se_connecter_path
  end

  scenario 'Correct email & password shows success message' do
    fill_in 'Email', :with => ENV['USERNAME']
    fill_in 'Password', :with => ENV['PASSWORD']

    click_button I18n.t('sign-in')
    expect(page).to have_content I18n.t('signed-in-flash')
  end

  scenario 'Incorrect email & password shows success message' do
    fill_in 'Email', :with => ENV['USERNAME']
    fill_in 'Password', :with => 'password'

    click_button I18n.t('sign-in')
    expect(page).to have_content I18n.t('sign-in-error-flash')
  end
end