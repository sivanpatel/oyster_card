class Oystercard
  BALANCE_LIMIT = 90.00
  MINIMUM_LIMIT = 1.99
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

  def touch_in
    fail "Your balance needs to be above #{MINIMUM_LIMIT}" if @balance < MINIMUM_LIMIT
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MINIMUM_LIMIT)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
