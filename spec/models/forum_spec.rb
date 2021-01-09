require 'rails_helper'

RSpec.describe Forum, type: :model do
  fixtures :users

  let(:params) { { name: 'Test forum', description: 'Test forum desc', admin: users(:one) } }
  subject { described_class.new(params) }

  describe 'validations' do
    it 'does not validate without a name' do
      subject.name = nil
      expect(subject.valid?).to be(false)
    end

    it 'does not validate without description' do
      subject.description = nil
      expect(subject.valid?).to be(false)
    end

    it 'does not validate without an admin' do
      subject.admin = nil
      expect(subject.valid?).to be(false)
    end

    it 'validates with valid data' do
      expect(subject.valid?).to be(true)
    end

    it 'saves new forum record to database' do
      expect(subject.save).to be(true)
    end
  end

  describe 'associations' do
    it { should belong_to(:admin).class_name(:User).with_foreign_key(:user_id) }
    it { should have_many(:posts).class_name(:Post).dependent(:destroy) }
    it { should have_many(:memberships).dependent(:destroy) }
    it { should have_many(:members).through(:memberships).class_name(:User).source(:user) }
  end
end
