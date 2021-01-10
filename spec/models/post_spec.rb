require 'rails_helper'

RSpec.describe Post, type: :model do
  fixtures :users, :forums

  let(:params) { { body: 'Post body', author: users(:one), forum: forums(:one) } }
  subject { described_class.new(params) }

  describe 'validations' do
    it { should validate_length_of(:body).is_at_most(256) }
    it { should validate_length_of(:body).is_at_least(1) }

    it 'validates post with valid data' do
      expect(subject.valid?).to be(true)
    end

    it 'saves new valid post to database' do
      expect(subject.save).to be(true)
      expect(described_class.count).to eq(2)
    end
  end

  describe 'associations' do
    it { should belong_to(:author).class_name(:User).with_foreign_key(:user_id) }
    it { should belong_to(:forum) }
    it { should have_many(:comments).class_name(:Comment).dependent(:destroy) }
  end
end
