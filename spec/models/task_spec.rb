require 'spec_helper'

describe Task do
  it { should validate_presence_of :description }
  it { should ensure_length_of(:description).is_at_most(50) }

  context '.completed/.not_completed' do
    it 'lists all tasks that are completed' do
      task1 = Task.create({description: 'stuff', done: 'nil'})
      task2 = Task.create({description: 'stuff', done: 'nil'})
      task3 = Task.create({description: 'stuff', done: 'true'})
      Task.completed.size.should eq 1
      Task.not_completed.should eq nil
    end
  end
end
