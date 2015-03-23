class Sponsor < ActiveRecord::Base

  has_many :paysites

  validates :title, :uniqueness => true

end
