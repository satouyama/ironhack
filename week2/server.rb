# #Inside of server.rb
require 'sinatra'
require 'sinatra/reloader'
# We're going to need to require our class files
require_relative("lib/search.rb")
require_relative('lib/task.rb')
require_relative('lib/ToDoList.rb')



# set :todo_list do
#   ToDoList.new("Josh")
# end
enable :sessions

todo_list = ToDoList.new("Josh")
# task = Task.new("Walk the dog")
# task2 = Task.new("Buy the milk")
# task3 = Task.new("Make my todo list into a web app")
# todo_list.add_task!(task)
# todo_list.add_task!(task2)
# todo_list.add_task!(task3)

# todo_list.save

get "/tasks" do
  @tasks = todo_list.load_tasks
  todo_list.tasks = @tasks["Josh"]
  erb(:task_index)
end

get "/new_task" do
  erb(:task_form)
end

post "/create_task" do
  new_content = params[:new_task_1]
  # puts new_content.class
  
  # new_content
  # puts "haha + #{new_task.content}"
  # puts new_task.class
  saved_data = todo_list.load_tasks
  old_array = saved_data["Josh"]
  Task.current_id = old_array[0].id + 1
  new_task = Task.new(new_content)
  # puts " -----------------old array------------------"
  # p old_array
  todo_list.tasks.insert(0,new_task)

  # todo_list.tasks = todo_list
  if todo_list.tasks == [new_task]
    todo_list.tasks = (todo_list.tasks | old_array) 
  end
  
  todo_list.save
  # puts "------------------------new task list----------------------------------"
  # p todo_list.tasks
  # todo_list.save
  redirect to("/tasks")
  # erb(:)

end

get "/complete/:id" do
  id = params[:id]
  deleted_item = todo_list.search id
  deleted_item.complete!

  # todo_list.delete_by_id id
  # p todo_list.tasks
  todo_list.save



  redirect to("/tasks")
end

get "/delete/:id" do
  id = params[:id]
  todo_list.delete_by_id id
  todo_list.save

  redirect to("/tasks")
end