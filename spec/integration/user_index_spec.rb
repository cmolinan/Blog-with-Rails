require 'rails_helper'

RSpec.describe User, type: :system do
  describe 'index page' do
    it 'shows the right content' do
      sleep(1)
      visit root_path
      expect(page).to have_content('Users List:')
    end
  end
end

RSpec.describe User, type: :system do
  describe 'index page' do
    
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
      visit root_path
    end
    sleep(2)
    it 'displays the number of posts written in the pages' do
      expect(page).to have_content("Number of posts:", count: 4)
      expect(page).to have_content("Number of posts: #{@first_user.posts_counter}")
      expect(page).to have_content("Number of posts: #{@second_user.posts_counter}")
    end
    it 'displays the name of all the users' do
      expect(page).to have_content(@first_user.name)
      expect(page).to have_content(@second_user.name)
      expect(page).to have_content(@third_user.name)
      expect(page).to have_content(@fourth_user.name)
    end
    it 'when clicks a user, redirects to that users page.' do
      click_link @first_user.name
      sleep(1)
      expect(current_path).to match user_path(@first_user)
     end
  end
end