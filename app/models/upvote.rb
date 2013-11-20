class Upvote < ActiveRecord::Base
  belongs_to :response
  belongs_to :user

  validates_uniqueness_of :user_id, scope: :response_id
end
