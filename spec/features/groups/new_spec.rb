require 'rails_helper'

RSpec.feature 'New Group Creation', type: :feature do
  scenario 'User creates a new group with valid information' do
    user = User.create!(name: 'Test User', email: 'test@example.com', password: 'password', confirmed_at: Time.now)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Next'

    visit new_group_path

    expect(page).to have_content('Add a new category')

    fill_in 'Name', with: 'New Group'
    attach_file('group_icon', "#{Rails.root}/app/assets/images/defaultgroupicon.png")

    click_button 'Save'

    expect(page).to have_current_path(groups_path)
  end
end
