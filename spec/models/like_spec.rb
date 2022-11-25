require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'The like model' do
    it { should belong_to(:author) }
    it { should belong_to(:post) }
  end

  context 'Testing the like model' do
    subject do
      @user01 = User.new(name: 'Mark', photo: 'https://image.com/01.jpg', bio: 'Born in USA')
      @post01 = Post.new(author: @user01, title: 'Hello Mark', text: 'What about you ?')
      Like.create(author: @user01, post: @post01)
    end

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'update_likes_counter' do
      expect(subject).to respond_to(:update_likes_counter)
    end
  end
end
