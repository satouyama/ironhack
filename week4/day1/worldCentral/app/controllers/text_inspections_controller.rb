class TextInspectionsController < ApplicationController

  def new
    render "new"

  end


  def create 

    @text = params[:text_inspection][:user_text]

    @word_count = @text.split(/\W+/).length

    @word_array = @text.split(/\W+/)

    @word_frequency = {}

    @word_array.each do |element|
      if @word_frequency.key?(element)
        @word_frequency[element] +=1
      else
        @word_frequency[element] = 1
      end
    end


    @sorted_word_frequency = @word_frequency.sort_by do |key,value|
      value 
    end


    # render plain: @word_frequency
    render plain: @sorted_word_frequency.reverse![0..9]


  end

end
