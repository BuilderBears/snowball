class Tag < ActiveRecord::Base
  has_many :topic_tags
  has_many :topics, :through => :topic_tags

  def self.find_or_create_by_csv_string(csv_string)
    tag_names = csv_string.split(",").collect do |item|
      item.strip.downcase
    end
    tag_names.collect do |this_tag_name|
      Tag.find_or_create_by(:name => this_tag_name)
    end
  end


end
