class Expense < ApplicationRecord
  belongs_to :group
  validates :name, :amount, :date, presence: true
  validates :name, length: { maximum: 50 }
  validates :amount, numericality: true
  validates :group_id, presence: true

  # I have not included the numericality, because it I want to use expenses and income in my app.
  # The expense is an expense if it is negative.

  # validates :amount, numericality: { greater_than: 0 }

  # I have not included the date validation because,
  # if a user wants to plan for the future month's exenses and see what they will have available in budget.
  # Then they can.
  # validate :date_cannot_be_in_the_future

  # def date_cannot_be_in_the_future
  #   if date.present? && date > Date.today
  #     errors.add(:date, "can't be in the future")
  #   end
  # end
end
