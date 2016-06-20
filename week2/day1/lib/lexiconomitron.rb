# Iteration 3 Oompa Loompa


class Lexiconomitron
    
    def oompa_loompa input
        array1 = input.select do |element|
            element.length <= 3 
        end
        #p array1
        new_array = array1.map do |element|
            eat_t(element)
        end
        p new_array
        new_array
    end
    def eat_t(input)
        input.gsub(/[t,T]/,"")
    end

end





# #Iteration 2 Shazam

# class Lexiconomitron
#     def eat_t(input)
#         input.gsub(/[t,T]/,"")
#     end
#     def shazam input
#         input.each do |element|
#             element.reverse!
#         end
#         array1 = [input[0],input[-1]]
#         new_array =array1.map do |element|
#             eat_t(element)
#         end
#         new_array
#     end

# end








# # #Iteration 1
# # class Lexiconomitron
# #     def eat_t(input)
# #         input.delete("t")
# #     end


# # end