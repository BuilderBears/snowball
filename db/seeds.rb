# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

vinney = User.create(name: 'Vinney', email: 'vinney@email.com', password: 'password', password_confirmation: 'password')
amanda = User.create(name: 'Amanda', email: 'amanda@email.com', password: 'test', password_confirmation: 'test')
ruby_help = Topic.create(title: 'ruby-help', description: 'looking for ruby resources', user_id: 1)
ruby_suggestion_one = Suggestion.create(title: 'this one was helpful', url: 'http://www.google.com', topic_id: 1, user_id: 1)
ruby_suggestion_two = Suggestion.create(title: 'i liked this site', url: 'https://www.facebook.com', topic_id: 1, user_id: 1)
ruby_suggestion_one.upvotes.create(user_id: vinney.id)
ruby_suggestion_one.upvotes.create(user_id: amanda.id)
