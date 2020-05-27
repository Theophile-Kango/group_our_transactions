class Transaction < ApplicationRecord
  belongs_to :user
  has_many :group_transactions, dependent: :destroy
  has_many :groups, through: :group_transactions

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

end
