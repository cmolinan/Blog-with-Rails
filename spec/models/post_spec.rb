require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'The post model' do
    it { should belong_to(:author) }
    it { should have_many(:likes) }
    it { should have_many(:comments) }
  end

  context 'Testing the post model' do
    subject do
      @user01 = User.new(name: 'Mark', photo: 'https://image.com/01.jpg', bio: 'Born in USA', posts_counter: 0)
      Post.new(author: @user01, title: 'Hello Mark', text: 'What about you ?', comments_counter: 1)
    end

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without comments_counter' do
      subject.comments_counter = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid if comment counter is negative' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'is not valid without likes_counter' do
      subject.likes_counter = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid if likes counter is negative' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end

    it 'update post counter' do
      expect(subject).to respond_to(:update_post_counter)
    end

    it 'selects five recent comments' do
      expect(subject).to respond_to(:five_recent_comments)
    end
  end
end
