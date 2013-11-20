class User < ActiveRecord::Base
  has_many :topics
  has_many :responses
  has_many :upvotes

  has_secure_password
  validates_uniqueness_of :email
end
