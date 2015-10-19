class Oystercard
  BALANCE_LIMIT = 90.00
  MINIMUM_LIMIT = 1.99
  attr_reader :balance, :start_station
  attr_accessor :in_journey

  def initialize
    @balance = 0.00
    @in_journey = false
    @start_station = nil
  end

  def top_up(amount)
    fail "Maximum balance of #{BALANCE_LIMIT} exceeded" if @balance + amount > BALANCE_LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail "Your balance needs to be above #{MINIMUM_LIMIT}" if @balance < MINIMUM_LIMIT
    @start_station = station
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    @start_station = nil
    deduct(MINIMUM_LIMIT)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
