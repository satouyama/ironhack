require_relative("../lib/post.rb")
require_relative("../lib/sponsored.rb")
require_relative("../lib/blog.rb")
require "rspec"


RSpec.describe Post do
  let :new_post do
      Post.new("into the wild",Date.new(2000,10,4),"died","happy","dead man")
  end

  describe "#title" do
    context "when given into the wild as title" do
      it "returns into the wild" do
        expect(new_post.title).to eq "into the wild"
      end
    end
  end

  describe "#date" do
    context "when given Date.new(2000,10,4)" do
      it "returns Date.new(2000,10,4)" do
        expect(new_post.date).to eq Date.new(2000,10,4)
      end
    end
  end  

  describe "#text" do
    context "when given died" do
      it "returns died" do
        expect(new_post.text).to eq "died"
      end
    end
  end

  describe "#category" do
    context "when given happy category" do
      it "returns happy" do
        expect(new_post.category).to eq "happy"
      end
    end
  end

  describe "#author" do
    context "when given dead man author" do
      it "returns dead man" do
        expect(new_post.author).to eq "dead man"
      end
    end
  end

end