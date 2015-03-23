class User < ActiveRecord::Base
  has_many :galleries, :foreign_key => 'owner_id'
end
