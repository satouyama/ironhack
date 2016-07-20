class UsersController < ApplicationController

  before_action :authenticate_user!, only: :show # redirect to sign in page if no user logged in

  def show
    # @user = User.find(params[:id])

    render "show"
  end
end
