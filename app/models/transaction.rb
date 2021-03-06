class Transaction < ApplicationRecord
  belongs_to :user
  has_many :group_transactions, dependent: :delete_all
  has_many :groups, through: :group_transactions
  validates :name, :total, presence: true

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
