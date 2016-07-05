  

class AsciisController < ApplicationController

  def new


    render "new"
  end 

  def create
    @text = params[:user_text]
    happy = Artii::Base.new :font => "graffiti"
    @asciified_text = happy.asciify(@text)

    render "create"


  end
end
