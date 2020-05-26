class User < ApplicationRecord
    has_many :groups
    has_many :transactions
    validates :name, presence: true
    has_one_attached :avatar
    
end
