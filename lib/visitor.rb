class Visitor
  attr_reader :name, :height, :spending_money, :preferences
  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money
    @preferences = []
  end

  def spending_money
    @spending_money.scan(/[.0-9]/).join.to_i
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(height_check)
    height_check <= @height
  end
end
