class ConcertsController < ApplicationController
  def index
    @all_concerts = Concert.all

    render "index"
  end


  def show
    concert_id = params[:id]
    @specific_concert = Concert.find(concert_id)

    @new_comment = Comment.new
    @old_comments = Comment.where(concert_id:concert_id)

    # render plain: @old_comments.inspect
    render "show"
    


  end


  def new

    @new_concert = Concert.new

    render "new"
  end


  def create 
    @new_concert = Concert.new(concert_params)

    if @new_concert.save
      redirect_to "/concerts"
    else
      render "new"
    end


  end

  private 

  def concert_params
    params.require(:concert).permit(:artist,:venue,:city,:date,:price,:description)    #require the key time_entry if not in ,then error

  end



end
