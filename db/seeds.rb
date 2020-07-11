# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create user accounts 

=begin

Post.where("user_id != ?","4").destroy_all
ActsAsVotable::Vote.where("voter_id != ?","4").destroy_all
User.where("email != ?","admin@coder.com").destroy_all

=end


Post.destroy_all
ActsAsVotable::Vote.destroy_all
User.destroy_all

connection = ActiveRecord::Base.connection()
connection.execute("UPDATE sqlite_sequence SET seq=0 where name='users';")
connection.execute("UPDATE sqlite_sequence SET seq=0 where name='posts';")
connection.execute("UPDATE sqlite_sequence SET seq=0 where name='votes';")

User.create!([
{
  email: "ross@friends.com",
  password: "password",
},
{
  email: "rachel@friends.com",
  password: "password",
},
{
  email: "chandler@friends.com",
  password: "password",
},
{
  email: "joey@friends.com",
  password: "password",
},
{
  email: "phoebe@friends.com",
  password: "password",
},
{
  email: "monica@friends.com",
  password: "password",
},
{
  email: "admin@friends.com",
  password: "password",
},
{
  email: "ceo@friends.com",
  password: "password",
},
{
  email: "hr@friends.com",
  password: "password",
}])

Post.create!([{
  title: "AHA flavored water please",
  text: "This new-ish Coca-Cola brand is good, can we get some for the fridge?",
  user_id: 1,
  status: "Active",
  product: "Food and Drinks",
},
{
  title: "Monday or Friday for all-hands - Friday pm please",
  text: "I think end of the week is a good time for the all hands, to wind down and celebrate our accomplishments.",
  user_id: 2,
  status: "Active",
  product: "Meetings",
},
{
  title: "Waterloo flavored water please",
  text: "This is an Austin brand, and tastes good. Who wants to support Austin? I do. 💧",
  user_id: 3,
  status: "Active",
  product: "Food and Drinks",
  notes: "Good idea, we'll add to the selection."
},
{
  title: "QOTD: What is a skill that you have to work hard at to be good?",
  text: "Sometimes we have to work harder than others just to be ok at something. ",
  user_id: 4,
  status: "Active",
  product: "Culture",
},
{
  title: "QOTD: What is a food you didn't like, but like now?",
  text: "This is often something you disliked as a kid, and grown to love it as you got older. ",
  user_id: 5,
  status: "Active",
  product: "Culture",
},
{
  title: "QOTD: What's your super power?",
  text: "Like something you know you're good at, that others may not typically be as good at. ",
  user_id: 2,
  status: "Active",
  product: "Culture",
},
{
  title: "Rename internal customer Slack channels with c in front",
  text: "Makes it easier to find the channels in the list",
  user_id: 5  ,
  status: "Active",
  product: "Slack",
}
])
 
p "Created #{User.count} users"
p "Created #{Post.count} posts"
