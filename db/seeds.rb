# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

authors = User.create!([
  {name: 'Tom Gibb', photo:'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico', email: 'tom@m.com', password: '666666', password_confirmation: '666666'},
  {name: 'Lilly Chen', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from China', email: 'lilly@m.com', password: '666666', password_confirmation: '666666'},
  {name: 'Fred Sullivan', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer from USA', email: 'fred@m.com', password: '666666', password_confirmation: '666666'},
  {name: 'Simon Johnson', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Engineer from INdia', email: 'simon@m.com', password: '666666', password_confirmation: '666666'},
])

posts = Post.create!([
  {user_id: 1, title: 'Hello friend 1', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do'},
  {user_id: 1, title: 'Hello friend 2', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do '},
  {user_id: 1, title: 'Hello friend 3', text: 'accusantium doloremque laudantium, totam rem aperiam, eaque ipsa'},
  {user_id: 1, title: 'Hello friend 4', text: 'dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum'},
  {user_id: 3, title: 'Hello friend 5', text: 'Ut enim ad minima veniam, quis nostrum exercitationem'},
  {user_id: 3, title: 'Hello friend 6', text: 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur'},
  {user_id: 4, title: 'Hello friend 7', text: 'consectetur, adipisci velit, sed quia non numquam eius modi tempora '}
])

comments = Comment.create!([
  {user_id: 2, post_id: 1, text: 'error sit voluptatem accusantium doloremque'},
  {user_id: 3, post_id: 1, text: 'magni dolores eos qui ratione voluptatem sequ'},
  {user_id: 3, post_id: 1, text: 'Ut enim ad minima veniam, quis nostrum exercitationem'},
  {user_id: 1, post_id: 2, text: 'dolor sit amet, consectetur, adipisci velit, sed quia'}
])

likes = Like.create!([
  {user_id: 1, post_id: 2},
  {user_id: 2, post_id: 7},
  {user_id: 4, post_id: 2},
  {user_id: 3, post_id: 7},
])
