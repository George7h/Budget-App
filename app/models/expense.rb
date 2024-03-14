class Expense < ApplicationRecord
  belongs_to :group
  validates :name, :amount, :date, presence: true
  validates :name, length: { maximum: 50 }
  validates :amount, numericality: true
  validates :group_id, presence: true
  validates :amount, presence: true,
                     numericality: { greater_than_or_equal_to: -10_000_000, less_than_or_equal_to: 10_000_000 }
end
