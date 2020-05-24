require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'validation test' do
    it 'ensures first name presence' do
      transaction = Transaction.new(name: 'Practice one', total: 2).save
      expect(transaction).to eq(false)
    end
  end

  context 'Association' do
    it 'should belong to user' do
      t = Transaction.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end
    it 'should have many group_transactions' do
      t = Transaction.reflect_on_association(:group_transactions)
      expect(t.macro).to eq(:has_many)
    end
    it 'should have many groups' do
      t = Transaction.reflect_on_association(:groups)
      expect(t.macro).to eq(:has_many)
    end
  end

end
