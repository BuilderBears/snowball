class Response < ActiveRecord::Base
  has_many :upvotes
  belongs_to :concern 
  belongs_to :user
end
