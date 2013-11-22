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

  def tag_names=(csv_tag_names)
    Tag.find_or_create_by_csv_string(csv_tag_names).each do |tag|
      self.add_tag(tag)
    end
  end

  def add_tag(tag)
    self.topic_tags.build(:tag => tag)
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end
