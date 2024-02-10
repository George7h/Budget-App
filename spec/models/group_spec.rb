require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(name: 'Test User', email: 'test@example.com', password: 'password')
    group = Group.new(name: 'Test Group', user:)
    group.icon.attach(io: File.open('app/assets/images/defaultgroupicon.png'), filename: 'defaultgroupicon.png',
                      content_type: 'image/png')
    expect(group).to be_valid
  end

  it 'is not valid without a name' do
    group = Group.new
    expect(group).not_to be_valid
  end

  it 'is not valid without an icon' do
    user = User.create(name: 'Test User', email: 'test@example.com', password: 'password')
    group = Group.new(name: 'Test Group', user:)
    expect(group).not_to be_valid
    expect(group.errors[:base]).to include('You must provide an icon URL or upload an icon image')
  end
end
