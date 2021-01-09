require 'rails_helper'

RSpec.describe Member, type: :model do
  let(:params) { { name: 'John Doe', username: 'johndoe', email: 'johndoe@example.com', password: 'password' } }
  subject { described_class.new(params) }

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:username) }

    it 'validates member with valid data' do
      expect(subject.valid?).to be(true)
    end

    it 'saves new member to database' do
      expect(subject.save).to be(true)
      expect(described_class.count).to eq(2)
    end
  end

  context 'associations' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
  end
end
