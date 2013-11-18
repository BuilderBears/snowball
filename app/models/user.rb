class User < ActiveRecord::Base
  has_many :concerns
  has_many :responses
  has_many :upvotes
end
