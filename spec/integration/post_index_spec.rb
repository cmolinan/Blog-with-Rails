require 'rails_helper'

RSpec.describe Post, type: :system do
  describe 'it-s index page' do
    before(:each) do
      @first_photo = 'https://thumbs.dreamstime.com/z/highly-detailed-fine-art-portrait-smiling-happy-real-person-space-copy-91883652.jpg'
      @second_photo = 'https://thumbs.dreamstime.com/z/happy-person-arms-raised-outstretched-69762123.jpg'
      @third_photo = 'https://thumbs.dreamstime.com/z/happy-smiling-portrait-16652685.jpg'
      @fourth_photo = 'https://thumbs.dreamstime.com/z/smniling-man-portrait-multiracial-smiling-happy-real-person-blue-background-33713302.jpg'
      @first_user = User.create(name: 'Tom', photo: @first_photo, bio: 'Teacher from Mexico.')
      @second_user = User.create(name: 'Lilly', photo: @second_photo, bio: 'Teacher from Poland.')
      @third_user = User.create(name: 'Peter', photo: @third_photo, bio: 'Developer from France.')
      @fourth_user = User.create(name: 'Fred', photo: @fourth_photo, bio: 'Artist from Germany.')
      @first_post = Post.create(author: @first_user, title: 'Hello #1', text: 'This is my first post')
      @second_post = Post.create(author: @first_user, title: 'Hello #2', text: 'This is my second post')
      @third_post = Post.create(author: @first_user, title: 'Hello #3', text: 'This is my third post')
      @fourth_post = Post.create(author: @first_user, title: 'Hello #4', text: 'This is my fourth post')

      @first_comment = Comment.create(post: @first_post, author: @second_user, text: 'Hello world #1')
      @second_comment = Comment.create(post: @first_post, author: @second_user, text: 'Hello world #2')
      Comment.create(post: @first_post, author: @second_user, text: 'Hi, my friend. Comment 1')
      Comment.create(post: @first_post, author: @second_user, text: 'Hi, my friend. Comment 2')
      Comment.create(post: @first_post, author: @third_user, text: 'Hi, my friend. Comment 3')
      Comment.create(post: @first_post, author: @fourth_user, text: 'Hi, my friend. Comment 4')
      Like.create(author: @first_user, post: @first_post)
      Like.create(author: @second_user, post: @first_post)
      visit user_posts_path(@first_user.id)
    end

    it 'shows the name of the user' do
      expect(page).to have_content(@first_user.name)
    end

    it 'shows the number of posts of the user' do
      expect(page).to have_content("Number of posts: #{@first_user.posts_counter}")
    end

    it 'shows the title of a post' do
      expect(page).to have_content(@first_post.title)
    end

    it 'shows presence of text of the post' do
      expect(page).to have_content(@first_post.text)
    end

    it 'shows comments on a post.' do
      expect(page).to have_content(@second_comment.text)
      expect(page).to_not have_content(@first_comment.text)
    end

    it 'shows number of comments of a post' do
      expect(page).to have_content("Comments: #{@first_post.comments_counter}")
    end

    it 'shows number of likes of a post' do
      expect(page).to have_content("Likes: #{@first_post.likes_counter}")
    end

    it 'shows button named pagination' do
      expect(page).to have_button('Pagination')
    end
  end
end
