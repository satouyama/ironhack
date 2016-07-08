class CommentsController < ApplicationController



  def create



    # @new_comment = Comment.new(comment_params)

    # concert_id = @new_comment.concert_id

    @current_concert_id = params[:concert_id]
    @current_concert = Concert.find(@current_concert_id)

    @new_comment = @current_concert.comments.new(comment_params)

    # render plain: @new_comment.inspect

    @new_comment.save

    redirect_to :back

    # redirect_to "/concerts/#{@current_concert_id}"




  end

  private

  def comment_params
    params.require(:comment).permit(:user_name,:comment,:concert_id)    #require the key time_entry if not in ,then error

  end


end
