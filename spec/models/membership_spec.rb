require 'rails_helper'

RSpec.describe Membership, type: :model do
  fixtures :users, :forums

  let(:params) { { user: users(:one), forum: forums(:one) } }
  subject { described_class.new(params) }

  describe 'validations' do
    it 'should not validate without user_id' do
      subject.user = nil
      expect(subject.valid?).to be(false)
    end

    it 'should not validate without forum_id' do
      subject.forum = nil
      expect(subject.valid?).to be(false)
    end

    it 'validates with valid data' do
      expect(subject.valid?).to be(true)
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:forum) }
  end
end
