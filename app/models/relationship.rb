class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validate :same_user

  private

  def same_user
    if self.follower_id == self.followed_id
      errors.add(:base, "自分はフォローできません")
    end
  end
end
