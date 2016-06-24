require "imdb"

class Movie
  
  # just for testing purposes will save the result now


  

  def get_final_list word

    list = initiate_search word
    filter_poster list
  end

  def initiate_search word
    the_search = Imdb::Search.new(word)
    
    the_list = the_search.movies
  end



  def filter_poster list_of_movies
    counter =0 
    new_array = []
    length1 = new_array.length
    
    while length1 <10 
      if list_of_movies[counter].poster != nil
        new_array << list_of_movies[counter]
      end

      if new_array.length == 9 
        break
      end
      counter += 1
    end
    
    p new_array
    new_array
  end



end