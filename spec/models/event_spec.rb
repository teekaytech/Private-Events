require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { User.create(username: 'john', email: 'john@john.com') }
  subject { described_class.create(user_id: user.id, location: 'Abuja', event_date: DateTime.now - 1.week, description: 'It is an avenue to mingle together') }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is invalid when location is absent' do
    subject.location = nil
    expect(subject).to_not be_valid
  end

  it 'is invalid when event date is absent' do
    subject.event_date = nil
    expect(subject).to_not be_valid
  end

  it 'is invalid when the description is absent' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it { should belong_to(:creator) }
    it { should have_many(:attendees) }
    it { should have_many(:users_events) }
  end
end
