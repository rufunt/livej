class Tag < ActiveRecord::Base
  has_many :posts, through: :tagings
  has_many :taggings
end
