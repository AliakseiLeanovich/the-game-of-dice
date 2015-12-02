require_relative 'dice'

class GameStep
  def initialize(initial_score, rate)
    @score, @rate = initial_score, rate
    @first_dice = Dice.roll
    @second_dice = Dice.roll
  end

  def check_result
    count_score
    { score: @score, dice1: @first_dice.value, dice2: @second_dice.value }
  end

  private
  
  def count_score    
    up_score = (@rate == @first_dice.value + @second_dice.value)
    @score += up_score ? 1 : -1 
  end
end
