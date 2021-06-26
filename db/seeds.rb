# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   login_id: 'tel123',
   email: 'tel@take.com',
   password: 'take123',
)

Genre.create!(
  [
    {
     genre_name: '和食'
    },
    {
     genre_name: '洋食'
    },
    {
     genre_name: '中華料理'
    },
    {
     genre_name: 'アジア料理'
     },
    {
     genre_name: 'ヨーロッパ料理'
    },
    {
     genre_name: '肉料理'
    },
    {
     genre_name: 'スイーツ'
     },
  ]
)