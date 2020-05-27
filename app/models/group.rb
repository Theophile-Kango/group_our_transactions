class Group < ApplicationRecord
  belongs_to :user
  has_many :group_transactions, dependent: :destroy
  has_many :transactions, through: :group_transactions
  has_one_attached :icon
  validates :name, :icon, presence: true


  def add_group_trans(trans)
    group_transactions.create(transaction: trans)
  end

  def has?(value)
    group_transactions.include?(value)
  end

end
