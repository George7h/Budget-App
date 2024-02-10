require 'rails_helper'

RSpec.describe "expenses/new", type: :feature do
  before(:each) do

    user = User.create!(
      name: "Test User",
      email: "test@example.com",
      password: "password",
      password_confirmation: "password",
      confirmed_at: Time.now
    )


    @group = user.groups.create!(
      name: "Takeouts",
      icon: File.open(Rails.root.join("app", "assets", "images", "defaultgroupicon.png"))
    )


    visit new_user_session_path
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Next'
    expect(page).to have_content 'Signed in successfully.'
  end

  it "creates a new expense with valid information" do
    visit new_group_expense_path(@group)

    fill_in "Name", with: "McDonald's"
    fill_in "Amount", with: 10.0
    fill_in "Date", with: Date.today

   
    select "Takeouts", from: "Category"  

    click_button "Save"


    expect(page).to have_content "McDonald's"
    expect(page).to have_content "$10.00"
  end
end
