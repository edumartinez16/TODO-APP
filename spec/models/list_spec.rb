require 'rails_helper'

RSpec.describe List, type: :model do
  let(:list) do
    List.new(name: 'test_list')
  end

  context 'when the list has an invalid name' do
    let(:name) { 'x' * 51 }
    it 'should not be longer than 50 characters' do
      expect(list).not_to be_valid
    end
  end

  context 'when the list has an invalid name' do
    let(:name) { '' }
    it 'is invalid' do
      expect(list).not_to be_valid
    end
  end
end