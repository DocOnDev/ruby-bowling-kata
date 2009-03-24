class Bowling
  
  def initialize
    @rolls = Array.new
  end
  
  def roll(pins)
    @rolls.push(pins)
  end
  
  def score
    score = 0
    current_roll = 0
    (0..9).each do
      score += rolled_a_mark?(current_roll) && score_a_mark(current_roll) || score_a_frame(current_roll)
      current_roll += rolled_a_strike?(current_roll) && 1 || 2
    end
    return score
  end
  
private

  def rolled_a_mark?(current_roll)
    rolled_a_strike?(current_roll) || rolled_a_spare?(current_roll)
  end

  def rolled_a_spare?(current_roll)
    (@rolls[current_roll] + @rolls[current_roll+1]) == 10
  end
  
  def rolled_a_strike?(current_roll)
    (@rolls[current_roll]) == 10
  end
  
  def score_a_mark(current_roll)
    @rolls[current_roll] + @rolls[current_roll+1] + @rolls[current_roll+2]
  end
  
  def score_a_frame(current_roll)
    @rolls[current_roll] + @rolls[current_roll+1]
  end
  
end
