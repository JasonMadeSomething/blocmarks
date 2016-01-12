30.times do
    p = Faker::Internet.password
    u = User.new(email: Faker::Internet.email, password: p, password_confirmation: p, user_name: Faker::Internet.user_name)
    u.skip_confirmation!
    u.save!
end
me = User.new(email: "jason@example.com", password: "123456", password_confirmation: "123456", user_name: "Jason" )
me.skip_confirmation!
me.save!
users = User.all
10.times {Topic.create!(title: Faker::Lorem.word, user: users.sample)}
topics = Topic.all
urls = ["google.com", "reddit.com", "nytimes.com", "whitehouse.gov", "wikipedia.org"]
100.times {Bookmark.create!(url: urls.sample, topic: topics.sample, user: users.sample)}