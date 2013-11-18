class Concern < ActiveRecord::Base
  has_many :responses
  belongs_to :user

  def response_attributes=(attributes)
    self.responses.find_or_initialize_by(attributes)
  end

end
