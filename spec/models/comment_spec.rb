require 'rails_helper'

RSpec.describe Comment, type: :model do
  fixtures :posts, :members

  let(:params) { { text: 'Test comment', post: posts(:one), member: members(:one) } }
  subject { described_class.new(params) }

  describe 'validations' do
    it { should validate_length_of(:text).is_at_least(3) }
    it { should validate_length_of(:text).is_at_most(256) }

    it 'does not validate without a member' do
      subject.member = nil
      expect(subject.valid?).to be(false)
    end
  end

  describe 'associations' do
    it { should belong_to(:post).required(true) }
    it { should belong_to(:member).required(true) }
  end
end
