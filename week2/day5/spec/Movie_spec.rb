require_relative("../lib/Movie.rb")

require "rspec"
require "imdb"



RSpec.describe Movie do
  describe "#filter_poster" do
    context "when given a list of IMDB movie objects" do
      it "returns 9 with posters" do
        the_search = Imdb::Search.new("funny")
        the_list = the_search.movies
        counter =0 
        new_array = []
        length1 = new_array.length
        
        while length1 <10 
          if the_list[counter].poster != nil
            new_array << the_list[counter]
          end

          if new_array.length == 9 
            break
          end
          counter += 1
        end

        expect(subject.filter_poster(the_list)).to eq new_array

      end
    end
  end

  
end