class Response < ActiveRecord::Base
  has_many :upvotes
  belongs_to :concern 
  belongs_to :user

  validates :title, presence: true
  validates_format_of :url, with: /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/
end
