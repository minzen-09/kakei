class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable #, :recoverable

  validates :name, presence: true, length: { maximum: 30 }

  has_many :posts, dependent: :destroy
  has_many :budgets, dependent: :destroy

end
