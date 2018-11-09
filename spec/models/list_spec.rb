require 'rails_helper'

RSpec.describe List, type: :model do
  before do
    @list = List.new(name: 'test_list')
  end
  it 'name should not be longer than 50 characters' do
    @list.name = 'x' * 51
    expect(@list).not_to be_valid
  end
  it 'should have name' do
    @list.name = ''
    expect(@list).not_to be_valid
  end
end
