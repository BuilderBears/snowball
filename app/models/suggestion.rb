class Suggestion < ActiveRecord::Base
  include LinkScraper

  has_many :upvotes
  belongs_to :topic 
  belongs_to :user

  validates_format_of :url, with: /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/
  validates_presence_of :user_id

  before_create :set_title

  private
    def set_title
      self.title = scrape_title(self.url)
    end
end
