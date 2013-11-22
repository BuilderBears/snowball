class User < ActiveRecord::Base
  has_many :topics
  has_many :suggestions
  has_many :upvotes
  has_many :comments

  has_secure_password
  validates_uniqueness_of :email
end
