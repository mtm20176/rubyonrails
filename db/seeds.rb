Post.destroy_all
ActsAsVotable::Vote.destroy_all
User.destroy_all

connection = ActiveRecord::Base.connection()
connection.execute("UPDATE sqlite_sequence SET seq=0 where name='users';")
connection.execute("UPDATE sqlite_sequence SET seq=0 where name='posts';")
connection.execute("UPDATE sqlite_sequence SET seq=0 where name='votes';")

ActsAsVotable::Vote.create!([
  {votable_type: "Post", votable_id: 5, voter_type: "User", voter_id: 5, vote_flag: true, vote_scope: nil, vote_weight: 1},
  {votable_type: "Post", votable_id: 3, voter_type: "User", voter_id: 5, vote_flag: true, vote_scope: nil, vote_weight: 1},
  {votable_type: "Post", votable_id: 2, voter_type: "User", voter_id: 5, vote_flag: true, vote_scope: nil, vote_weight: 1},
  {votable_type: "Post", votable_id: 3, voter_type: "User", voter_id: 6, vote_flag: true, vote_scope: nil, vote_weight: 1},
  {votable_type: "Post", votable_id: 5, voter_type: "User", voter_id: 6, vote_flag: true, vote_scope: nil, vote_weight: 1},
  {votable_type: "Post", votable_id: 3, voter_type: "User", voter_id: 4, vote_flag: true, vote_scope: nil, vote_weight: 1},
  {votable_type: "Post", votable_id: 1, voter_type: "User", voter_id: 4, vote_flag: true, vote_scope: nil, vote_weight: 1},
  {votable_type: "Post", votable_id: 7, voter_type: "User", voter_id: 4, vote_flag: true, vote_scope: nil, vote_weight: 1},
  {votable_type: "Post", votable_id: 3, voter_type: "User", voter_id: 3, vote_flag: true, vote_scope: nil, vote_weight: 1},
  {votable_type: "Post", votable_id: 7, voter_type: "User", voter_id: 3, vote_flag: true, vote_scope: nil, vote_weight: 1},
  {votable_type: "Post", votable_id: 4, voter_type: "User", voter_id: 3, vote_flag: true, vote_scope: nil, vote_weight: 1},
  {votable_type: "Post", votable_id: 5, voter_type: "User", voter_id: 3, vote_flag: true, vote_scope: nil, vote_weight: 1},
  {votable_type: "Post", votable_id: 3, voter_type: "User", voter_id: 1, vote_flag: true, vote_scope: nil, vote_weight: 1},
  {votable_type: "Post", votable_id: 5, voter_type: "User", voter_id: 1, vote_flag: true, vote_scope: nil, vote_weight: 1},
  {votable_type: "Post", votable_id: 7, voter_type: "User", voter_id: 1, vote_flag: true, vote_scope: nil, vote_weight: 1}
])

User.create!([
  {email: "ross@friends.com", password: "password", encrypted_password: "$2a$11$4g7Aks3iq3e/Njye341BAuEoGjXqptX.OzThBPne1GzxXl9MuVdqK", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, description: nil},
  {email: "rachel@friends.com", password: "password", encrypted_password: "$2a$11$FwBtWE8NPDuWgFp07KW3oeqfF9TnRaAe1dPFszE0fnn.68BXSks3.", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, description: nil},
  {email: "chandler@friends.com", password: "password", encrypted_password: "$2a$11$NZPb/PO7lw6w3IC7S0bUSefpXHRwq0ZVdPbBac8ajpdfuc/PF.k2i", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, description: nil},
  {email: "joey@friends.com", password: "password", encrypted_password: "$2a$11$b8VUqI7gMnQFnAE7LKCajOE29o2aR/wtv/oUuC4QvjnA.wbn0Y4cO", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, description: nil},
  {email: "phoebe@friends.com", password: "password", encrypted_password: "$2a$11$P/T/c/s4YPQfLPwBJLw.B.ST6uJfb.KYnBwhX1euTmQnMIfvzrBve", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, description: nil},
  {email: "monica@friends.com", password: "password", encrypted_password: "$2a$11$uMYyunY5mO./riDWiNRVfeV.5/FlozblW1DT6DzOXVgeFYBkGDqWi", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, description: nil},
  {email: "admin@friends.com", password: "password", encrypted_password: "$2a$11$tKNjU42nq/uvl76PTlIFbujUt22IWPKyv/AoE93ZTIbOUAFqGQlYq", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, description: nil},
  {email: "ceo@friends.com", password: "password", encrypted_password: "$2a$11$8681yMvvEcnpnTa8Jb14LeCriB1SLTOp/UchnalW2X8/y12BUfMY2", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, description: nil},
  {email: "hr@friends.com", password: "password", encrypted_password: "$2a$11$pRwzsswm42Ubjbr77J8gM.5oJrgMFsu0e1UyRYePenzPZzvzoBoWS", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, description: nil}
])

Post.create!([
  {title: "AHA flavored water please", text: "This new-ish Coca-Cola brand is good, can we get some for the fridge?", user_id: 1, cached_votes_total: 1, cached_votes_score: 1, cached_votes_up: 1, cached_votes_down: 0, cached_weighted_score: 1, cached_weighted_total: 1, cached_weighted_average: 1.0, product: "Food and Drinks", status: "Active", notes: nil, anonymous: false},
  {title: "Monday or Friday for all-hands - Friday pm please", text: "I think end of the week is a good time for the all hands, to wind down and celebrate our accomplishments.", user_id: 2, cached_votes_total: 1, cached_votes_score: 1, cached_votes_up: 1, cached_votes_down: 0, cached_weighted_score: 1, cached_weighted_total: 1, cached_weighted_average: 1.0, product: "Meetings", status: "Active", notes: nil, anonymous: false},
  {title: "Waterloo flavored water please", text: "This is an Austin brand, and tastes good. Who wants to support Austin? I do. 💧", user_id: 3, cached_votes_total: 5, cached_votes_score: 5, cached_votes_up: 5, cached_votes_down: 0, cached_weighted_score: 5, cached_weighted_total: 5, cached_weighted_average: 1.0, product: "Food and Drinks", status: "Active", notes: "Good idea, we'll add to the selection.", anonymous: false},
  {title: "QOTD: What is a skill that you have to work hard at to be good?", text: "Sometimes we have to work harder than others just to be ok at something. ", user_id: 4, cached_votes_total: 1, cached_votes_score: 1, cached_votes_up: 1, cached_votes_down: 0, cached_weighted_score: 1, cached_weighted_total: 1, cached_weighted_average: 1.0, product: "Culture", status: "Active", notes: nil, anonymous: false},
  {title: "QOTD: What is a food you didn't like, but like now?", text: "This is often something you disliked as a kid, and grown to love it as you got older. ", user_id: 5, cached_votes_total: 4, cached_votes_score: 4, cached_votes_up: 4, cached_votes_down: 0, cached_weighted_score: 4, cached_weighted_total: 4, cached_weighted_average: 1.0, product: "Culture", status: "Active", notes: nil, anonymous: false},
  {title: "QOTD: What's your super power?", text: "Like something you know you're good at, that others may not typically be as good at. ", user_id: 2, cached_votes_total: 0, cached_votes_score: 0, cached_votes_up: 0, cached_votes_down: 0, cached_weighted_score: 0, cached_weighted_total: 0, cached_weighted_average: 0.0, product: "Culture", status: "Active", notes: nil, anonymous: false},
  {title: "Rename internal customer Slack channels with c in front", text: "Makes it easier to find the channels in the list", user_id: 5, cached_votes_total: 3, cached_votes_score: 3, cached_votes_up: 3, cached_votes_down: 0, cached_weighted_score: 3, cached_weighted_total: 3, cached_weighted_average: 1.0, product: "Slack", status: "Active", notes: "7/12 We've noticed the list of customer slack channels is increasing, so this makes sense and have implemented the naming change so the channels show up all in one section of the list.  👖📝", anonymous: false}
])


p "Created #{User.count} users"
p "Created #{Post.count} posts"
p "Created #{ActsAsVotable::Vote.count} votes"
