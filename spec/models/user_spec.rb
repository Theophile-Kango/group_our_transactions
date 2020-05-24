require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation' do
    subject do
      described_class.new(name: 'Theo')
    end

    it 'is valid with valid name' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  context 'Association' do
    it 'should have many groups' do
      t = User.reflect_on_association(:groups)
      expect(t.macro).to eq(:has_many)
    end
    it 'should have many transactions' do
      t = User.reflect_on_association(:transactions)
      expect(t.macro).to eq(:has_many)
    end
  end
end
