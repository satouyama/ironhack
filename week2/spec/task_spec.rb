require_relative("../lib/task.rb")

class Counter
  def initialize starting = 0
    @counter =starting
  end

  def count 
    @counter += 10
  end

  # class << self
  #   def increment
  #     @count ||= 0
  #     @count += 1
  #   end
    
  #   def count
  #     @count ||= 0
  #   end
  # end
end

RSpec.describe Task do 
  # let :new_task do
  #   Task.new
  # end
  # shared_examples_for ("testing") do
  #   it "testing" do

  #     expect(subject.count).to eq 10
  #   end
  # end

  # describe Counter do
  #   it_behaves_like "testing"
  # end



  describe "let memoized" do
    context "when already initiated by let" do
      let(:ti_counter) {Counter.new}
      it "trait transfers" do
      
        expect(ti_counter.count).to eq(10)
      end
      it "transfers to the next one without creating" do
        expect(ti_counter.count).to eq(20)
      end
    end
  end

  # using complete? methods
  describe "complete status manipulations" do

    xdescribe "#complete?" do
      context "when initiated through default" do
        it "is incomplete" do
          new_task = Task.new("Buy the milk")
          expect(new_task.completed?).to be false
        end
      end
      context "when initiated with complete status" do
        it "is complete" do
          new_task = Task.new("Buy the milk", true)
          expect(new_task.completed?).to be true
        end
      end
    end
    
    # make complete
    describe "#complete!" do
      context "when used on uncomplete tasks" do
        it "is complete" do
          new_task = Task.new("Buy the milk")
          expect(new_task.complete!).to be true
        end
      end
    end

    # make incomplete
    describe "#make_incomplete!" do
      pending("debugging")
      context "when used on complete tasks" do
        it "is incomplete" do
          new_task = Task.new("Buy the milk",true)
          expect(new_task.make_incomplete!).to be false
        end
      end
    end
  end

  describe "date data manipulations" do
    describe "#created_at" do
      context "when created at the time" do
        it "is current time" do
         
          new_task = Task.new("Buy the milk",false)
          expect(new_task.created_at).to be_an_instance_of Time
        end
      end
    end

    describe "#updated_at" do
      context "Before updating" do
        it "is nil" do
          new_task = Task.new("Buy the milk")
          expect(new_task.updated_at).to be_nil
        end
      end

      context "After updating" do
        it "is the updated time" do
          new_task = Task.new("Buy the milk")
          new_task.update_content!("throw up")
          expect(new_task.updated_at).to be_an_instance_of Time
        end
      end
      
    end
  end

  describe "content manipualtions" do
    describe "#update_content!" do
      context "when updated with buy the dog" do
        it "is buy the dog" do
          new_task = Task.new("hug the dog")
          expect(new_task.update_content!("buy the dog")).to eq "buy the dog"
        end
      end
    end
  end

describe Counter, "#increment" do
  it "should increment the count" do
    expect{Counter.increment}.to change{Counter.count}.from(0).to(1)
  end

  # deliberate failure
  it "should increment the count by 2" do
    expect{Counter.increment}.to change{Counter.count}.by(1) 
  end

  it "compound expectations" do
    expect("happy dog").to start_with("happy") & end_with("dog")
  end

  xit "composing expectations" do
    array = ["apple","banana","ham"]
    expect(array).to 
  end


end

  

 
end