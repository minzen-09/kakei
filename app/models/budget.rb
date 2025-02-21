class Budget < ApplicationRecord
  belongs_to :user

  enum category: { expenditure: 0, income: 1}
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, allow_blank: true, length: { maximum: 100 }
  validates :amount, presence: true, numericality: { only_integer: true }
end
