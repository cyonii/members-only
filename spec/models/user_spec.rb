require 'rails_helper'

RSpec.describe User, type: :model do
  let(:params) { { name: 'John Doe', username: 'johndoe', email: 'johndoe@example.com', password: 'password' } }
  subject { described_class.new(params) }

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:username) }

    it 'validates user with valid data' do
      expect(subject.valid?).to be(true)
    end

    it 'saves new valid user to database' do
      expect(subject.save).to be(true)
      expect(described_class.count).to eq(3)
    end
  end

  context 'associations' do
    it { should have_many(:forums).through(:memberships) }
    it { should have_many(:administered_forums).class_name(:Forum) }
    it { should have_many(:memberships).dependent(:destroy) }
    it { should have_many(:posts) }
    it { should have_many(:comments) }
  end
end
