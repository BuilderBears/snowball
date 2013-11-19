class Concern < ActiveRecord::Base
  has_many :responses
  belongs_to :user

  validates_presence_of :title, :description
  validates_uniqueness_of :title

  def response_attributes=(attributes)
    self.responses.find_or_initialize_by(attributes)
  end

end
