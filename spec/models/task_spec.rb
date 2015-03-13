require 'rails_helper'

describe Task do
  it { should validate_presence_of :description }
  it { should belong_to :list }

  describe('.not_done') do
    it("returns the tasks that are not done") do
      list = List.create({:name => "Housework", :description => "chores around the house"})
      task1 = Task.create({:description => "vaccum", :done => false})
      task2 = Task.create({:description => "sweep", :done => true})
      expect(Task.not_done()).to(eq(task1))
    end
  end
end
