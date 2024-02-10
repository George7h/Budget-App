class Group < ApplicationRecord
  has_many :expenses
  belongs_to :user
  has_one_attached :icon

  validates :name, presence: true
  validate :valid_icon_url_or_attachment

  private

  def valid_icon_url_or_attachment
    return if icon.attached?

    errors.add(:base, 'You must provide an icon URL or upload an icon image')
  end
end
