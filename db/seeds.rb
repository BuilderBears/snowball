# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

vinney = User.create(name: 'Vinney', email: 'vinney@email.com', password: 'password')
ruby_help = Concern.create(title: 'ruby-help', description: 'looking for ruby resources')
ruby_response_one = Response.create(title: 'this one was helpful', url: 'www.google.com', concern_id: 1, user_id: 1)
ruby_response_two = Response.create(title: 'i liked this site', url: 'www.facebook.com', concern_id: 1, user_id: 1)
ruby_response_one.upvotes.create(user_id: vinney.id)
