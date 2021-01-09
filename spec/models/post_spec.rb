require 'rails_helper'

RSpec.describe Post, type: :model do
  fixtures :members

  let(:params) { { title: 'Post title', body: 'Post body', author: members(:one) } }
  subject { described_class.new(params) }

  describe 'validations' do
    it { should validate_length_of(:title).is_at_least(1) }
    it { should validate_length_of(:title).is_at_most(80) }
    it { should validate_length_of(:body).is_at_most(1200) }
    it { should validate_length_of(:body).is_at_least(1) }
  end

  describe 'associations' do
    it { should belong_to(:author).class_name(:Member).with_foreign_key(:member_id) }
    it { should have_many(:comments).class_name(:Comment).dependent(:destroy) }
  end
end
