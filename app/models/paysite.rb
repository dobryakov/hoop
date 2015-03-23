class Paysite < ActiveRecord::Base

  belongs_to :sponsor
  has_many   :galleries

  validates :title, :uniqueness => {:scope => :sponsor_id}

end
