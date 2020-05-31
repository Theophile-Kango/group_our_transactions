class User < ApplicationRecord
  has_many :groups
  has_many :transactions
  validates :name, presence: true, uniqueness: true
  validates :name, length: { minimum: 5, maximum: 15 }
  has_one_attached :avatar

  def total
    sum = 0
    transactions.each do |trans|
      sum += trans.total
    end
    sum
  end
end
