
require_relative("../lib/lexiconomitron")

#Iteration 3 Oompa Loompa
RSpec.describe Lexiconomitron do 
 describe "#eat_t" do
   let :lexi do
            Lexiconomitron.new
    end

   it "only one word with 3 characters or less  and t removed" do
     expect(lexi.oompa_loompa(["tis","tedious","tidings","this","computer","stuff"])).to eq(["is"])
   end

   it "words that all have T/s" do
       expect(lexi.oompa_loompa(["Tea","Taste","terribly","tasty"])).to eq(["ea"])      
   end

   it "one that only has 2 t" do
       expect(lexi.oompa_loompa(["there","is","no","t","in","the","word","pen"])).to eq(["is","no","","in","he","pen"])
   end

 end
end


# #Iteration 2 Shazam
# RSpec.describe Lexiconomitron do
#     let :lexi do
#         Lexiconomitron.new
#     end

#     describe "#shazam" do
#         it "reverse array and return only first and last without t" do
#             expect(lexi.shazam(["This","is","a","boring","test"])).to eq ["sih","se"]        
#         end
#     end
# end






# #Iteration 1
# RSpec.describe Lexiconomitron do 
#   describe "#eat_t" do
#     it "removes every letter t from the input" do
#       @lexi = Lexiconomitron.new
#       expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
#     end
#   end


# end