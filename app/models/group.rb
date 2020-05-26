class Group < ApplicationRecord
  belongs_to :user
  has_many :group_transactions
  has_many :transactions, through: :group_transactions
  has_one_attached :icon
  validates :name, :icon, presence: true


  def add_group_trans(group_id, transaction)
    trans = Transaction.all.where(transaction_id: transaction).first
    @group_transaction = Group_transaction.new(group_id: id, transaction_id: trans.id)
    @group_transaction.save
  end

  def delete_group_trans(trans)
    group_trans = Group_transaction.all.where(id: trans.id).first
    group_trans.destroy
  end

end
