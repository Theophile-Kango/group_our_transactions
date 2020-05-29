require 'rails_helper'

RSpec.describe Group, type: :model do
  context 'validation test' do
    it 'ensures name presence' do
      group = Group.new(name: 'Programming cours').save
      expect(group).to eq(false)
    end
  end

  context 'Association' do
    it 'should belong to user' do
      t = Group.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end
    it 'should have many group_transactions' do
      t = Group.reflect_on_association(:group_transactions)
      expect(t.macro).to eq(:has_many)
    end
    it 'should have many transactions' do
      t = Group.reflect_on_association(:transactions)
      expect(t.macro).to eq(:has_many)
    end
  end
end
