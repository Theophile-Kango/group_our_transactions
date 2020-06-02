require 'rails_helper'

RSpec.describe GroupTransaction, type: :model do
  context 'Association' do
    it 'should belong to group' do
      t = GroupTransaction.reflect_on_association(:group)
      expect(t.macro).to eq(:belongs_to)
    end
    it 'should belong to user_transaction' do
      t = GroupTransaction.reflect_on_association(:user_transaction)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
