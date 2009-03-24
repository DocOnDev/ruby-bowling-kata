require "lib/bowling"

class TestBowling
  describe Bowling do
    
    before(:each) do
      @bowling = Bowling.new
    end
    
    it "should exist" do
      @bowling
    end
    
    it "should score 0 for all gutters" do
      repeat_rolls(20,0)
      @bowling.score.should == 0
    end
    
    it "should score 20 for a game of all ones" do
      repeat_rolls(20,1)
      @bowling.score.should == 20
    end

    it "should score a 20 when a 5 is thrown after a spare" do
      (0..2).each do
        @bowling.roll(5)
      end
      repeat_rolls(17,0)
      @bowling.score.should == 20
    end
    
    it "should score a 24 when a strike is followed by a 3 and 4" do
      @bowling.roll(10)
      @bowling.roll(3)
      @bowling.roll(4)
      repeat_rolls(17,0)
      @bowling.score.should == 24
    end
    
    it "should score 10 when a strike is followed by two gutter balls" do
      @bowling.roll(10)
      repeat_rolls(19,0)
      @bowling.score.should == 10
    end
    
    it "should score 20 when a gutter is followed by rolls of 10 and 5 pins" do
      @bowling.roll(0)
      @bowling.roll(10)
      @bowling.roll(5)
      repeat_rolls(17,0)
      @bowling.score.should == 20
    end
    
    it "should score 300 for rolls of all 10" do
      repeat_rolls(19,10)
      @bowling.score.should == 300
    end
    
    it "should score 150 for rolls of all 5" do
      repeat_rolls(21,5)
      @bowling.score.should == 150
    end

    def repeat_rolls(number_of_rolls, pins)
      (1..number_of_rolls).each do
        @bowling.roll(pins)
      end
    end
  end
end