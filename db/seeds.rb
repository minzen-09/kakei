# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..10).each do |i|
  user = User.create!(name: "name_#{i}", email: "test_#{i}@test.com", password: "password")
  (1..rand(1..3)).each do |n|
    user.posts.create!(title: "test_user_#{i}", body: "x" * rand(10..100))
  end
  (1..rand(1..2)).each do |n|
    user.budgets.create!(title: "test_user_#{i}", body: "x" * rand(10..20),
                         amount: 10000 * rand(10..20), category: :income,
                         payment_date: Time.current.ago(rand(1..2).month))
  end
  (1..rand(1..20)).each do |n|
    user.budgets.create!(title: "test_user_#{i}", body: "x" * rand(10..20),
                         amount: 100 * rand(1..5),
                         payment_date: Time.current.ago(rand(1..20).days))
  end
end