class GroupTransaction < ApplicationRecord
  belongs_to :group, optional: true
  belongs_to :user_transaction, class_name: 'Transaction', foreign_key: 'tarnsaction_id', optional: true

end
