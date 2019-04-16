# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create user accounts for SparkCognition sales team

Post.where("user_id != ?","4").destroy_all
ActsAsVotable::Vote.where("voter_id != ?","4").destroy_all
User.where("email != ?","mmilligan@sparkcognition.com").destroy_all

User.create!([{
  email: "jmcgugan@sparkcognition.com",
  password: "spark1234",
},
{
  email: "bswidler@sparkcognition.com",
  password: "spark1234",
},
{
  email: "rpither@sparkcognition.com",
  password: "spark1234",
},
{
  email: "daitzhanov@sparkcognition.com",
  password: "spark1234",
},
{
  email: "tboon@sparkcognition.com",
  password: "spark1234",
},
{
  email: "ateran@sparkcognition.com",
  password: "spark1234",
},
{
  email: "bfreels@sparkcognition.com",
  password: "spark1234",
},
{
  email: "cborberg@sparkcognition.com",
  password: "spark1234",
},
{
  email: "ideloera@sparkcognition.com",
  password: "spark1234",
},
{
  email: "dmarlow@sparkcognition.com",
  password: "spark1234",
},
{
  email: "jdesrosier@sparkcognition.com",
  password: "spark1234",
},
{
  email: "rsadakane@sparkcognition.com",
  password: "spark1234",
},
{
  email: "drocha@sparkcognition.com",
  password: "spark1234",
},
{
  email: "adingley@sparkcognition.com",
  password: "spark1234",
},
{
  email: "hkinoshita@sparkcognition.com",
  password: "spark1234",
},
{
  email: "hkhater@sparkcognition.com",
  password: "spark1234",
},
{
  email: "mcapotosto@sparkcognition.com",
  password: "spark1234",
},
{
  email: "aghauche@sparkcognition.com",
  password: "spark1234",
},
{
  email: "jhamm@sparkcognition.com",
  password: "spark1234",
},
{
  email: "pherve@sparkcognition.com",
  password: "spark1234",
},
{
  email: "aerizmendi@sparkcognition.com",
  password: "spark1234",
},
{
  email: "bmurphy@sparkcognition.com",
  password: "spark1234",
},
{
  email: "jcanipe@sparkcognition.com",
  password: "spark1234",
},
{
  email: "kschaerges@sparkcognition.com",
  password: "spark1234",
},
{
  email: "meadie@sparkcognition.com",
  password: "spark1234",
},
{
  email: "twhite@sparkcognition.com",
  password: "spark1234",
},
{
  email: "jfitzgerald@sparkcognition.com",
  password: "spark1234",
},
{
  email: "bnason@sparkcognition.com",
  password: "spark1234",
},
{
  email: "dwright@sparkcognition.com",
  password: "spark1234",
},
{
  email: "ssudarsan@sparkcognition.com",
  password: "spark1234",
},
{
  email: "ushuja@sparkcognition.com",
  password: "spark1234",
},
{
  email: "amir@sparkcognition.com",
  password: "spark1234",
},
{
  email: "kmoore@sparkcognition.com",
  password: "spark1234",
},
{
  email: "sgorti@sparkcognition.com",
  password: "spark1234",
},
{
  email: "blares@sparkcognition.com",
  password: "spark1234",
},
{
  email: "jamrite@sparkcognition.com",
  password: "spark1234",
},
{
  email: "sgillen@sparkcognition.com",
  password: "spark1234",
},
{
  email: "rexprintz@sparkcognition.com",
  password: "spark1234",
},
{
  email: "jeskew@sparkcognition.com",
  password: "spark1234",
},
{
  email: "mgodard@sparkcognition.com",
  password: "spark1234",
},
{
  email: "apatel@sparkcognition.com",
  password: "spark1234",
},
{
  email: "jbrown@sparkcognition.com",
  password: "spark1234",
},
{
  email: "bspiesman@sparkcognition.com",
  password: "spark1234",
}])
 
p "Created #{User.count} users"
