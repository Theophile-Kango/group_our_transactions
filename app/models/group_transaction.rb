class GroupTransaction < ApplicationRecord
  belongs_to :group
  belongs_to :user_transaction, class_name: 'Transaction', foreign_key: :user_transaction_id
end
