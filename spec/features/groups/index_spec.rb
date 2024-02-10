require 'rails_helper'

RSpec.feature 'Groups', type: :feature do
  scenario 'index displays all groups' do
    
    user = User.create!(name: 'Tester', email: 'test@example.com', password: 'password', confirmed_at: Time.now)

    
    user.groups.create!(name: 'Group 1', icon: File.open(Rails.root.join('app', 'assets', 'images', 'defaultgroupicon.png')))
    user.groups.create!(name: 'Group 2', icon: File.open(Rails.root.join('app', 'assets', 'images', 'defaultgroupicon.png')))

    
    visit new_user_session_path
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Next'

    
    expect(page).to have_content 'Signed in successfully.'

    
    visit groups_path

    
    expect(page).to have_content 'Group 1'
    expect(page).to have_content 'Group 2'
  end
end
