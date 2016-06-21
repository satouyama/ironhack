require_relative("../lib/ToDoList.rb")
require_relative("../lib/task.rb")


RSpec.describe ToDoList do 
  let :new_list do
    ToDoList.new
  end
  describe "#add_task" do
    context "when the first task is added" do
      it "list has one task" do
        new_task = Task.new("buy milk")
        expect(new_list.add_task!(new_task)).to eq([new_task]) 
      end
    end

    context "when a few tasks are added " do 
      it "list has all tasks" do
        new_task = Task.new("buy milk")
        new_task2 = Task.new("eat apple")
        new_task3 = Task.new("walk the dog")
        task_array = new_task,new_task2,new_task3

        new_list.add_task!(new_task)
        new_list.add_task!(new_task2)
        new_list.add_task!(new_task3)
        expect(new_list.tasks).to eq task_array
      end
    end

  end

  describe "#delete_task" do
    # let :list do
    #   new_task = Task.new("buy milk")
    #   new_task2 = Task.new("eat apple")
    #   new_task3 = Task.new("walk the dog")
    #   task_array = new_task,new_task2,new_task3

    #   new_list.add_task!(new_task)
    #   new_list.add_task!(new_task2)
    #   new_list.add_task!(new_task3)
    # end

    context "when deleted by ID" do
      it "item is deleted" do
        Task.current_id = 1
        new_task = Task.new("buy milk")
        new_task2 = Task.new("eat apple")
        new_task3 = Task.new("walk the dog")
        task_array = new_task,new_task2,new_task3

        new_list.add_task!(new_task)
        new_list.add_task!(new_task2)
        new_list.add_task!(new_task3)
        id = new_task2.id
        expect(new_list.delete_task(id)).to eq new_task2 
      end
    end

    context "when ID item doesn't exist" do
      it "shows messages" do 
        new_task = Task.new("buy milk")
        new_task2 = Task.new("eat apple")
        new_task3 = Task.new("walk the dog")
        task_array = new_task,new_task2,new_task3

        new_list.add_task!(new_task)
        new_list.add_task!(new_task2)
        new_list.add_task!(new_task3)
      
        expect(new_list.delete_task(100)).to be_nil
      end
    end 
  end

  describe "#find_task_by_id" do
    context "when first item is buy the milk" do
      it "buy the milk" do
        Task.current_id = 1
        new_list = ToDoList.new
        task1 = Task.new("Walk the dog")
        task2 = Task.new("Buy the milk")
        new_list.add_task!(task1)
        new_list.add_task!(task2)

        
        expect(new_list.find_task_by_id(1)).to eq task1
      end
    end

    context "when the id doesn't exist" do
      it "return nil" do
        new_list = ToDoList.new
        task1 = Task.new("Walk the dog")
        task2 = Task.new("Buy the milk")
        new_list.add_task!(task1)
        new_list.add_task!(task2)

        
        expect(new_list.find_task_by_id(100)).to be_nil
      end
    end
  end


  describe "#sort_by_created" do
    context "when get input DESC" do
      it "sort from latest to oldest" do
        new_task = Task.new("buy milk")
        new_task2 = Task.new("eat apple")
        new_task3 = Task.new("walk the dog")
        new_task.created_at = Time.new(2002, 10, 31)
        new_task2.created_at = Time.new(2008, 10, 31)
        new_task3.created_at = Time.new(2002, 8, 31)

        new_list = ToDoList.new
        new_list.add_task!(new_task)
        new_list.add_task!(new_task2)
        new_list.add_task!(new_task3)

        expected_order = [new_task2, new_task, new_task3]

        expect(new_list.sort_by_created("DESC")).to eq expected_order

      end
    end

    context "when get input ASC" do
      it "sort from oldest" do
        new_task = Task.new("buy milk")
        new_task2 = Task.new("eat apple")
        new_task3 = Task.new("walk the dog")
        new_task.created_at = Time.new(2002, 10, 31)
        new_task2.created_at = Time.new(2008, 10, 31)
        new_task3.created_at = Time.new(2002, 8, 31)

        new_list = ToDoList.new
        new_list.add_task!(new_task)
        new_list.add_task!(new_task2)
        new_list.add_task!(new_task3)

        expected_order = [new_task3, new_task, new_task2]

        expect(new_list.sort_by_created("ASC")).to eq expected_order

      end
    end
  end

  describe "#user" do
    context "when passed with no users" do
      it "default user name is Thinkpad" do
        list = ToDoList.new
        expect(list.user).to eq "Thinkpad"

      end
    end

    context "when passed with 1 user John" do 
      it "user name John" do
        name = "John"
        list = ToDoList.new(name)

        expect(list.user).to eq "John"
      end
    end
  end
end