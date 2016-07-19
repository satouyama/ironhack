class UsersController < ApplicationController


  def index 
    @users_list = User.all

    render "index"
  end


  def new 

    @new_user = User.new

    render "new"

  end


  def show

    @user_id = params[:id]

    @user = User.find(@user_id)

    render "show"


  end

  def create 

    name = params[:user][:name]
    email = params[:user][:email]

    @new_user = User.new(name:name,email:email)

    if @new_user.save
      redirect_to "/users/#{@new_user.id}"
    else
      render "new"
    end

    # render plain: params.inspect

  end
end
