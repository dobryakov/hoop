class Gallery < ActiveRecord::Base
  belongs_to :paysite
  belongs_to :owner, class_name: 'User'
end
