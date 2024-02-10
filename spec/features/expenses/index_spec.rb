require 'rails_helper'

RSpec.describe "expenses/index", type: :feature do
  before(:each) do
    user = User.create!(
      name: "Test User",
      email: "test@example.com",
      password: "password",
      password_confirmation: "password",
      confirmed_at: Time.now
    )

    visit new_user_session_path
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Next'

    expect(page).to have_content 'Signed in successfully.'

    @group = user.groups.create!(
      name: "Group Name",
      icon: File.open(Rails.root.join("app", "assets", "images", "defaultgroupicon.png"))
    )

    @expenses = [
      Expense.create!(
        name: "Expense 1",
        amount: 50.0,
        date: Date.today,
        group: @group,
        author_id: user.id
      ),
    ]
  end

  it "displays list of expenses" do
    visit expenses_path

    @expenses.each do |expense|
      expect(page).to have_content(expense.group.name)
      expect(page).to have_content(expense.amount)
      expect(page).to have_content(expense.date.strftime("%B %d %Y"))
    end
  end


  
  it "displays 'No transactions yet' message when there are no expenses" do
    Expense.destroy_all

    visit expenses_path

    expect(page).to have_content("No transactions yet")
  end
end
