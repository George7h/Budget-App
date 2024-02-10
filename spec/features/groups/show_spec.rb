require 'rails_helper'

RSpec.describe 'groups/show', type: :feature do
  before(:each) do
    user = User.create!(
      name: 'Test User',
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'password',
      confirmed_at: Time.now
    )

    visit new_user_session_path
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Next'

    expect(page).to have_content 'Signed in successfully.'

    @group = user.groups.create!(
      name: 'Junk Food',
      icon: File.open(Rails.root.join('app', 'assets', 'images', 'defaultgroupicon.png'))
    )

    @expenses = [
      Expense.create!(
        name: 'McDonalds',
        amount: 50.05,
        date: Date.today,
        group: @group,
        author_id: user.id
      )
    ]
  end

  it 'renders group details and expenses' do
    visit group_path(@group)

    expect(page).to have_selector('.group-details-card')
    expect(page).to have_selector('.group-icon')
    expect(page).to have_content('Junk Food')
    expect(page).to have_css("img[src*='defaultgroupicon.png']")

    @expenses.each do |expense|
      expect(page).to have_content(expense.name)
      expect(page).to have_content(expense.amount)
      expect(page).to have_content(expense.date)
    end

    expect(page).to have_content('TOTAL PAYMENT')
  end
end
