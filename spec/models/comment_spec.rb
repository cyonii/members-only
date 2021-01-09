require 'rails_helper'

RSpec.describe Comment, type: :model do
  fixtures :posts, :users

  let(:params) { { text: 'Test comment', post: posts(:one), user: users(:one) } }
  subject { described_class.new(params) }

  describe 'validations' do
    it { should validate_length_of(:text).is_at_least(3) }
    it { should validate_length_of(:text).is_at_most(256) }

    it 'does not validate without a user' do
      subject.user = nil
      expect(subject.valid?).to be(false)
    end

    it 'should validate comment with valid data' do
      expect(subject.valid?).to be(true)
    end

    it 'saves new valid comment to database' do
      expect(subject.save).to be(true)
      expect(described_class.count).to eq(1)
    end
  end

  describe 'associations' do
    it { should belong_to(:post).required(true) }
    it { should belong_to(:user).required(true) }
  end
end
