module Search

  def search id
    @tasks.find do |x|
      # puts "id is #{id.class} and element id is #{x.id.class}"
      x.id == id.to_i
    end
  end
end