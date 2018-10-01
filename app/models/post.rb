class Post < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :tags, through: :tagings
  has_many :taggings
  validates :title, :summary, :body, presence: true
end
