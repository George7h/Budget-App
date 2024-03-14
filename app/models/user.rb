class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :expenses, foreign_key: :author_id, dependent: :destroy
  has_many :groups
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
