require "yaml/store"

class ToDoList
    attr_reader :tasks, :user
    def initialize user = "Thinkpad"
        @user = user
        @tasks = []
        @todo_store = YAML::Store.new("./public/tasks.yml")
    end
    def add_task! input

      @tasks << input
      #p @tasks
    end

    def delete_task id
      #puts "haha"
      #p @tasks
      #p id
      @tasks.delete_at(id - 1)
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
end