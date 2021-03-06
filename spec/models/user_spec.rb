require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(username: 'superuser', email: 'super@user.com') }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is valid when username is present' do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it 'is valid with or without email' do
    subject.email = nil
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { should have_many(:created_events).class_name('Event') }
    it { should have_many(:attended_events) }
    it { should have_many(:users_events) }
  end
end
