require "yaml/store"

class ToDoList

    attr_accessor :tasks, :user
    include Search

    def initialize user = "Thinkpad"
        @user = user
        @tasks = []
        @todo_store = YAML::Store.new("./public/tasks.yml")
    end
    def add_task! input
      puts "add_task method invoked"
      new_array = @tasks.insert(0,input)
      #p @tasks
    end

    def delete_task id
      #puts "haha"
      #p @tasks
      #p id
      @tasks.delete_at(id - 1)
    end

    def delete_by_id id
      @tasks.delete_if do |element|
        puts "ID IS #{id} ---------------------------------------- and element id is #{element.id}"
        element.id == id.to_i
      end
      p @tasks
    end

    def find_task_by_id input
      
        @tasks.find do |element|

          element.id == input
        end
    end

    def sort_by_created order
      @tasks.sort! do |x,y|
        if order == "ASC"
         x.created_at <=> y.created_at 
        elsif order == "DESC"
          y.created_at <=> x.created_at
        end
      end
      @tasks
    end

    def save
      @todo_store.transaction do 
          @todo_store[@user] = @tasks
      end
    end

    def load_tasks
      YAML::load_file("./public/tasks.yml")

    end
end