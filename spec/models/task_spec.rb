require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @task = Task.new(description: 'test_task')
  end
  it 'name should not be longer than 50 characters' do
    @task.description = 'x' * 51
    expect(@task).not_to be_valid
  end
  it 'should have name' do
    @task.description = ''
    expect(@task).not_to be_valid
  end
end
