require 'rails_helper'

RSpec.describe 'expenses/edit', type: :feature do
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
      name: 'Grocieries',
      icon: File.open(Rails.root.join('app', 'assets', 'images', 'defaultgroupicon.png'))
    )

    @expense = Expense.create!(
      name: 'Expense 1',
      amount: 50.0,
      date: Date.today,
      group: @group,
      author_id: user.id
    )

    user.groups.create!(name: 'Electricity',
                        icon: File.open(Rails.root.join('app', 'assets', 'images',
                                                        'defaultgroupicon.png')))
    user.groups.create!(name: 'Junk food',
                        icon: File.open(Rails.root.join('app', 'assets', 'images',
                                                        'defaultgroupicon.png')))
  end

  it 'renders the edit expense form' do
    visit edit_group_expense_path(@group, @expense)

    expect(page).to have_content('Edit Expense')
    expect(page).to have_selector("form[action='#{group_expense_path(@group, @expense)}'][method='post']")
    expect(page).to have_field('Name', with: @expense.name)
    expect(page).to have_field('Amount', with: @expense.amount)
    expect(page).to have_field('Date', with: @expense.date.to_s)
    expect(page).to have_select('Category', selected: @group.name)
  end

  it 'updates the expense when submitted with valid information' do
    visit edit_group_expense_path(@group, @expense)

    fill_in 'Name', with: 'Updated Expense'
    fill_in 'Amount', with: -75.0
    fill_in 'Date', with: Date.today
    select 'Junk food', from: 'Category'

    click_button 'Save'



    expect(page).to have_content('$-75.00')
    expect(page).to have_content(Date.today)
    expect(@expense.reload.name).to eq('Updated Expense')
    expect(@expense.amount).to eq(-75.0)
    expect(@expense.date).to eq(Date.today)
    expect(@expense.group.name).to eq('Junk food')
  end
end
