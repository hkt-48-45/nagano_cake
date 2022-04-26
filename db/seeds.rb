# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Admin.create!(
#   email: 'admin@admin',
#   password: 'testtest'
# )


5.times do |n|
  Customer.create!(
      email: "#{n + 1}@#{n + 1}",
      first_name: "名#{n + 1}",
      last_name: "姓#{n + 1}",
      first_name_kana: "メイ",
      last_name_kana: "セイ",
      password: "123456",
      post_number: "#{n + 1}" * 7,
      address: "東京都東京都新宿区西新宿1-1-1 レオパレス10#{n + 1}号室",
      telephone_number: "080123456#{n + 1}"
    )
end



genres = ["ケーキ", "プリン", "焼き菓子", "キャンディ"]
genres.length.times do |i|
Genre.create!(
    name: genres[i]
  )
end


 item = Item.create!(
    name: "ショートケーキ",
    description: "甘くて美味しい　イチゴのショートケーキ",
    price: "400",
    genre_id: 1,

  )
  item.image.attach(io: File.open(Rails.root.join('app/assets/images/ケーキ3.jpg')), filename: 'default.jpg')

  item2 = Item.create!(
    name: "チーズケーキ",
    description: "ほんのり甘酸っぱい　チーズケーキ",
    price: "450",
    genre_id: 1,
  )
  item2.image.attach(io: File.open(Rails.root.join('app/assets/images/20130625125049.jpg')), filename: 'default.jpg')
