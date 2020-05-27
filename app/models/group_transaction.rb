class GroupTransaction < ApplicationRecord
  belongs_to :group
  belongs_to :user_transaction, class_name: 'Transaction', foreign_key: 'tarnsaction_id'

end
