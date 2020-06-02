class Group < ApplicationRecord
  belongs_to :user
  has_many :group_transactions, dependent: :delete_all
  has_many :transactions, through: :group_transactions, source: 'transaction'
  has_one_attached :icon

  validates :icon, attached: true, content_type: %i[png jpg jpeg]

  validates :name, presence: true, uniqueness: true

  def add_group_trans(trans)
    transactions << trans
  end

  def group_trans(param)
    group_transactions.find_by(param).nil?
  end

  def build_trans(param)
    group_transactions.build(param)
  end

  def has?(value)
    group_transactions.where(transaction: value).first
  end
end
