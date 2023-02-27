class Visitor
  attr_reader :name, :height, :spending_money, :preferences
  def initialize(name, height, spending_money, preferences = [])
    @name = name
    @height = height
    @spending_money = spending_money.delete_prefix("$").to_i
    @preferences = preferences
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(required_height)
    return false if @height < required_height
    true
  end
end
