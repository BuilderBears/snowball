class User < ActiveRecord::Base
  has_many :concerns, :responses, :upvotes
end
