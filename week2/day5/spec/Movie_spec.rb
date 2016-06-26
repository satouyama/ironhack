require_relative("../lib/Movie.rb")

require "rspec"
require "imdb"



RSpec.describe Movie do
  describe "#filter_poster" do
    context "when given a list of IMDB movie objects" do
      it "returns 9 with posters" do
        the_search = Imdb::Search.new("funny")
        the_list = the_search.movies

        
        # THIS IS TESTING DONE RIGHT!
        # counter =0 
        # new_array = []
        # length1 = new_array.length1
        
        # while new_array.length1 < 9 
        #   movie = list_of_movies[counter]
        
        #   if movie.poster != nil 
        #     if counter_for_rating == 0 && movie.rating.to_i < 5
        #       new_array << movie
        #       counter_for_rating = 1
        #       counter += 1
        #       next
        #     elsif counter_for_rating == 1
        #       new_array << movie
        #     end
        #   end
        #   counter += 1
        # end
        expect(subject.filter_poster(the_list).length).to eq 9

      end
    end
    context "when given rating threshold 5" do
      it "returns 9 with at least 1 lower than 5" do
        the_search = Imdb::Search.new("funny")
        the_list = the_search.movies
        # counter =0 
        # new_array = []
        # length1 = new_array.length1
        
        # while new_array.length1 < 9 
        #   movie = list_of_movies[counter]
        
        #   if movie.poster != nil 
        #     if counter_for_rating == 0 && movie.rating.to_i < 5
        #       new_array << movie
        #       counter_for_rating = 1
        #       counter += 1
        #       next
        #     elsif counter_for_rating == 1
        #       new_array << movie
        #     end
        #   end
        #   counter += 1
        # end
        # target_movie = new_array.find do |movie|
        #   movie.rating < 5
        # end

        # if target_movie

        item = the_list.find do |movie|
          movie.rating.to_f < 5
        end


        expect(subject.filter_poster(the_list)[0]).to eq item

      end
    end
  end
  
end