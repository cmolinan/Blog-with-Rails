require 'spec_helper'

RSpec.describe User, type: :model do
  context 'The user model' do
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should have_many(:posts) }
  end

  context 'Testing the user model' do
    subject do
      User.new(name: 'Mark', photo: 'https://image.com/01.jpg', bio: 'Born in USA', posts_counter: 0)
    end

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without posts_counter' do
      subject.posts_counter = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid if post counter is negative' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end

    it 'selects three recent posts' do
      expect(subject).to respond_to(:three_recent_posts)
    end
  end
end
