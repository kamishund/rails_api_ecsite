# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
6.times do |n|
    restaurant = Product.new(
        name: "testアイテム_#{n}",
        slug: "item#{n}",
        category:"shirt" ,
        image: "/helloworld.jpg",
        price: 1000,
        brand:"shund",
        countInStock: 10,
        description:"sampleテキストsampleテキストsampleテキストsampleテキストsampleテキストsampleテキスト",
    )

    restaurant.save!
  end