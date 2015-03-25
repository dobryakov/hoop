class Gallery < ActiveRecord::Base

  belongs_to :paysite
  belongs_to :owner, class_name: 'User'

  validates :url, presence: true, allow_blank: false

end
