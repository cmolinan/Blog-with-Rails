require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'The comment model' do
    it { should belong_to(:author) }
    it { should belong_to(:post) }
  end

  context 'Testing the comment counter' do
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

    it 'should return the number of comments' do
      subject.comments.new(author: @user01, text: 'Fine. Working at all')
      expect(subject.comments_counter).to eql 1
    end
  end
end
