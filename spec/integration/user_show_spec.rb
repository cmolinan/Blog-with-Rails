require 'rails_helper'

RSpec.describe User, type: :system do
  describe 'Testing the user/show path,' do
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
      visit user_path(@first_user)
      sleep(0.5)
    end

    it 'shows the username  of ther user' do
      expect(page).to have_content(@first_user.name)
    end

    it 'shows the number of posts of the user' do
      expect(page).to have_content("Number of posts: #{@first_user.posts_counter}")
    end

    it 'shows the bio of the user' do
      expect(page).to have_content(@first_user.bio)
    end

    it 'shows the first three posts of the user' do
      expect(page).to have_content(@second_post.text)
      expect(page).to_not have_content(@first_post.text)
    end

    it 'shows a button for permits the client view all of the posts of the user' do
      expect(page).to have_link('See all posts')
    end

    it 'if -See all Posts- is clicked, it goes to the user-posts index page' do
      click_button('See all posts')
      expect(page).to have_current_path(user_posts_path(@first_user))
    end
  end
end
