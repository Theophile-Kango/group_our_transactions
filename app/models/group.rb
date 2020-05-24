class Group < ApplicationRecord
  belongs_to :user
  has_many :group_transactions
  has_many :transactions, through: :group_transactions
  validates :name, :icon, presence: true
end
