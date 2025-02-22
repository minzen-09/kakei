class Budget < ApplicationRecord
  belongs_to :user

  enum category: { expenditure: 0, income: 1 }
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, allow_blank: true, length: { maximum: 100 }
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :payment_date, presence: true

  scope :expenditures, -> { where(category: :expenditure) }
  scope :incomes, -> { where(category: :income) }
end
