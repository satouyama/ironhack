#Inside of server.rb
require 'sinatra'
require 'sinatra/reloader'
# We're going to need to require our class files
require_relative('lib/Task.rb')
require_relative('lib/TodoList.rb')