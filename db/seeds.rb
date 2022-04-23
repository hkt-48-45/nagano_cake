# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'admin@admin',
   password: 'testtest'
)


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
      telephone_number: "0801234567#{n + 1}"
    )
end


genres = ["ケーキ", "プリン", "焼き菓子", "キャンディ"]
genres.length.times do |i|
Genre.create!(
    name: genres[i]
  )
end


# Item.create!(
#     name: "チョコレートケーキ",
#     description: "ヨーロッパ伝統の本格チョコケーキ",
#     price: "400",
#     sales_status: [['販売中', true], ['販売停止', false]],
#    #  image: open("./app/assets/images/no_image.jpg")
#  )