require "imdb"

class Movie
  
  # just for testing purposes will save the result now
  def initialize 
    @final_list = []
  end

  def get_questions_list 

    questions_list = {
      years:[0],
      directors:[0],
      ratings:[0]
    }

    @final_list.each do |movie|
      # puts "--------------------------questions list as a whole ----------------------"
      # p questions_list
      # p questions_list.class

      # puts "------------------------- questions_list shouldn't be nil ------------------------"
      # p questions_list[:years]
      # p questions_list[:years].class
      questions_list[:years] << movie.year


      questions_list[:directors] << movie.director
      questions_list[:ratings] << movie.rating
      # puts "--------------------current question list in Model processing ------------------"
      # p questions_list
    end

    questions_list

  end
  

  def get_final_list word

    list = initiate_search word


    # p list
    @final_list = filter_poster list

    
    filter_poster list
  end

  def initiate_search word
    the_search = Imdb::Search.new(word)
    
    the_list = the_search.movies
  end



  def filter_poster list_of_movies
    counter =0 
    counter_for_rating = 0
    new_array = []
    
    
    while new_array.length <9 
      movie = list_of_movies[counter]
      # puts "-------------------------------------------movie rating is ----------------------------------------------------"
      # puts movie.rating
      if movie.poster != nil 
        if counter_for_rating == 0 && movie.rating.to_i < 5
          new_array << movie
          counter_for_rating = 1
          counter += 1
          next
        elsif counter_for_rating == 1
          new_array << movie
        end
      end
      counter += 1
      # puts "-----------------------------current array is --------------------------------------"
   
      # puts "--------------------real current array length is----------------------------------"
      # p new_array.length
    end
    new_array
  end



end