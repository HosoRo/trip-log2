class Article < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1500 }
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search
      Article.where(['title LIKE(?)', "%#{search}%"])
    else
      Article.all
    end
  end
end