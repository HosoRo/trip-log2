class Article < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1500 }
  # validates :image, presence: true
  # belongs_to :user

  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments

  def self.search(search)
    if search
      Article.where('description LIKE(?)', "%#{search}%")
    else
      Article.all
    end
  end
end