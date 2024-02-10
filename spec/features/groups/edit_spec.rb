require 'rails_helper'

RSpec.feature 'New Group Creation', type: :feature do
  scenario 'User edits a group with valid information' do
    user = User.create!(name: 'Test User', email: 'test@example.com', password: 'password', confirmed_at: Time.now)
    user.groups.create!(name: 'Group 1',
                        icon: File.open(Rails.root.join('app', 'assets', 'images',
                                                        'defaultgroupicon.png')))

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Next'

    expect(page).to have_content 'Signed in successfully.'

    visit groups_path

    expect(page).to have_content 'Group 1'

    click_link 'Edit'

    expect(page).to have_content 'Edit Category'

    fill_in 'Name', with: 'edited group name'
    attach_file('group_icon', "#{Rails.root}app/assets/images/defaultgroupicon.png")

    click_button 'Save'

    expect(page).to have_current_path(groups_path)
  end
end
