require 'rails_helper'

RSpec.describe 'Splash page', type: :feature do
  before(:each) do
  User.delete_all
  @user = User.create!(name: 'Tester', email: 'tester@example.com', password: 'password123',
  password_confirmation: 'password123')
@user.confirm
end


  it 'shows the splash page' do
    visit root_path
    expect(page).to have_css('img.logo_splash')
  end

  it 'shows the login button' do
    visit root_path
    expect(page).to have_link('Log in', href: new_user_session_path)
  end

  it 'shows the sign up button' do
    visit root_path
    expect(page).to have_link('Sign up', href: new_user_registration_path)
  end

  # it 'showcases the splash screen' do
  #   visit root_path
  #   sleep(1)
  #   click_link('Log in')
  #   sleep(1)
  #   input_email = find_field('Email')
  #   input_email.send_keys('tester@example.com')
  #   sleep(1)
  #   input_password = find_field('Password')
  #   input_password.send_keys('password123')
  #   sleep(1)
  #   click_button('Next')
  # end
end
