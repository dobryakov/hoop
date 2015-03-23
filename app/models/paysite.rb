class Paysite < ActiveRecord::Base
  belongs_to :sponsor
  has_many   :galleries
end
