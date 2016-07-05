class TextGeneratorsController < ApplicationController


  def new 
    render "new"

  end

  def create 
    @number = params[:number].to_i
    @generated_type = params[:choice]

    quotes = ["Wikipedia Is The Best Thing Ever. Anyone In The World Can Write Anything They Want About Any Subject, So You Know You Are Getting The Best Possible Information.",
              "Don't Call My Mother Your Lover!",
              "Hate To See You Leave But Love To Watch You Go. 'Cause Of Your Butt.",
              "I Don't Understand The Desire To Push Sweet Potato Fries On Me. I Just Want Regular Fries."
    ]
    paragraph_index = 0

    @desired_output = []
   

    while @number > 0 do
      word_index = Random.rand(5)
      
      if @generated_type == "words"
        words_array = quotes[paragraph_index].split(/\W+/)

        @current_input = words_array[word_index]

      elsif @generated_type == "paragraphs"
        @current_input = quotes[paragraph_index]

      end

      @desired_output.push(@current_input)
      @number -= 1;
      paragraph_index += 1;

      if paragraph_index == 4
        paragraph_index = 0
      end


    end


    render "create"

  end

end
