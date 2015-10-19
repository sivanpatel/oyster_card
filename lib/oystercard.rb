class Oystercard
  BALANCE_LIMIT = 90.00

  attr_reader :balance
  attr_accessor :in_journey

  def initialize
    @balance = 0.00
    @in_journey = false
  end

  def top_up(amount)
    fail "Maximum balance of #{BALANCE_LIMIT} exceeded" if @balance + amount > BALANCE_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end
