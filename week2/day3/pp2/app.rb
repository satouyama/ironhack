require "artii"
require "sinatra"

# asciifier = Artii:Base.new(:font => "doh")

# puts asciifier.asciify("happy")

get "/ascii/:random_word/?:font?/?:secret?" do
    
    @random_word = params[:random_word]

    if params[:random_word] == "Dragon" && params[:font] == "Special" && params[:secret] == "Secret"
      erb(:dragon)
    else
    if params[:font] == nil
      @font = "doh"
    else
      @font = params[:font]
    end
    erb(:ascii)
  end

end