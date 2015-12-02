class Dice
  def initialize(value)
    @value = value
  end
  private_class_method :new
  attr_reader :value
  
  def Dice.roll
    new(rand(1..6))
  end
end
