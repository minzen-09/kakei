class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 500 }

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.search(keyword)
    self.where("title LIKE(?)", "%#{keyword}%").or(
      self.where("body LIKE(?)", "%#{keyword}%")
    )
  end
end
