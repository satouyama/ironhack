require_relative("../lib/post.rb")
require_relative("../lib/sponsored.rb")
require_relative("../lib/blog.rb")
require "rspec"


RSpec.describe Blog do
  before (:each) do
    @new_post = Post.new("into the wild",Date.new(2001,2,3),"died","happy","dead man")
    @new_post2 = Post.new("Wild",Date.new(2005,2,3),"died again","happy","dead man")
    subject.add_post @new_post
    subject.add_post @new_post2
  end

  describe "#posts" do
    context "when two posts added" do
      it "array lengths is 2" do
        expect(subject.posts.length).to eq 2
      end
    end

    context "when first post is into the wild" do
      it "returns into the wild post" do
        expect(subject.posts[0]).to eq @new_post 
      end
    end
  end

  describe "#latest_post" do
    context "when given oldest from lastest" do
      it "sorts from latest to oldest" do
        new_post3 = Post.new("apple",Date.new(2005,7,3),"ha","happy","dead man")
        new_post4 = Post.new("pear",Date.new(2009,2,3),"ho","happy","dead man")
        subject.add_post new_post3
        subject.add_post new_post4
        expected_array = [new_post4,new_post3,@new_post2,@new_post]
        
        expect(subject.latest_posts).to eq expected_array
      end
    end

    context "when given chaotic" do
      it "sorts from latest" do
        new_post3 = Post.new("apple",Date.new(1998,2,3),"hi","happy","dead man")
        new_post4 = Post.new("pear",Date.new(2003,2,3),"he","happy","dead man")
        subject.add_post new_post3
        subject.add_post new_post4
        expected_array = [@new_post2,new_post4,@new_post,new_post3]
        expect(subject.latest_posts).to eq expected_array

      end
    end
  end

end

