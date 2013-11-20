class Upvote < ActiveRecord::Base
  belongs_to :suggestion
  belongs_to :user

  validates_uniqueness_of :user_id, scope: :suggestion_id
end
