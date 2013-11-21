class Topic < ActiveRecord::Base
  has_many :suggestions
  has_many :topic_tags
  has_many :tags, :through => :topic_tags
  
  belongs_to :user

  validates_presence_of :title, :description
  validates_uniqueness_of :title

  def suggestion_attributes=(attributes)
    self.suggestions.find_or_initialize_by(attributes)
  end

end
