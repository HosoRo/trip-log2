class Article < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1500 }
  # validates :image, presence: true

  belongs_to :user
  has_many :comments

  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      Article.where(['title LIKE(?)', "%#{search}%"])
    else
      Article.all
    end
  end
end