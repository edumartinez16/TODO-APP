require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) do
    Task.new(description: 'test_list',
      limit: '2018/16/15')
  end

  context 'when the task description is longer than 50 characters' do
    let(:description) { 'x' * 51 }
    it 'should not be longer than 50 characters' do
      expect(task).not_to be_valid
    end
  end

  context 'when the list has an invalid name' do
    let(:name) { '' }
    it 'is not be invalid' do
      expect(task).not_to be_valid
    end
  end

  context 'when the task limit is valid' do
    let(:limit) { '' }
    it 'should not be valid' do
      expect(task).not_to be_valid
    end
  end
end
