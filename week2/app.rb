require "yaml"
require_relative("lib/task.rb")
require_relative("lib/ToDoList.rb")

# todo_list = ToDoList.new("Josh")
# task = Task.new("Walk the dog")
# task2 = Task.new("Buy the milk")
# task3 = Task.new("Make my todo list into a web app")

# todo_list.add_task!(task)
# todo_list.add_task!(task2)
# todo_list.add_task!(task3)


# todo_list.save
todo_list = TodoList.new("Josh")
task = Task.new("Walk the dog")
task2 = Task.new("Buy the milk")
task3 = Task.new("Make my todo list into a web app")
todo_list.save