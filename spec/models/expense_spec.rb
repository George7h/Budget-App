require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.create(email: 'test@example.com', password: 'password')
      user.confirm
      user.save
      group = user.groups.create(name: 'Test Group',
                                 icon: File.open(Rails.root.join('app', 'assets',
                                                                 'images', 'defaultgroupicon.png')))
      expense = group.expenses.new(name: 'Example Expense', amount: 50.0, date: Date.today)
      expect(expense).to be_valid
    end

    it 'is not valid without a group' do
      expense = Expense.new(name: 'Example Expense', amount: 50.0, date: Date.today)
      expect(expense).not_to be_valid
    end
    it 'is not valid if amount is more than 10,000,000' do
      user = User.create(email: 'test@example.com', password: 'password')
      user.confirm
      user.save
      group = user.groups.create(name: 'Test Group',
                                 icon: File.open(Rails.root.join('app', 'assets',
                                                                 'images', 'defaultgroupicon.png')))
      expense = group.expenses.new(name: 'Example Expense', amount: 10_000_001, date: Date.today)
      expect(expense).not_to be_valid
    end
    it 'is not valid if amount is less than -10,000,000' do
      user = User.create(email: 'test@example.com', password: 'password')
      user.confirm
      user.save
      group = user.groups.create(name: 'Test Group',
                                 icon: File.open(Rails.root.join('app', 'assets',
                                                                 'images', 'defaultgroupicon.png')))
      expense = group.expenses.new(name: 'Example Expense', amount: -10_000_001, date: Date.today)
      expect(expense).not_to be_valid
    end
  end
end
