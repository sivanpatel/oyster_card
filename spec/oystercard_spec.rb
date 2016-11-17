require 'oystercard'

describe Oystercard do

  let(:station) { double :station }

  it 'should have an initial balance' do
    expect(subject.balance).to equal(0.00)
  end

  it 'should be able to top up to increase the balance' do
    subject.top_up(1.00)
    expect(subject.balance).to equal (1.00)
  end

  it 'should not be able to top up past a maximum limit' do
    maximum_balance = Oystercard::BALANCE_LIMIT
    subject.top_up(maximum_balance)
    expect{ subject.top_up(1) }.to raise_error("Maximum balance of #{maximum_balance} exceeded")
  end

  it 'should initialize not being in a journey' do
    expect(subject.in_journey).to be(false)
  end

  it 'when it touches in, it should be in a journey' do
    subject.top_up(2.00)
    subject.touch_in (station)
    expect(subject.in_journey).to be(true)
  end

  it 'when it touches out, it should not be in a journey' do
    subject.top_up(2.00)
    subject.touch_in (station)
    subject.touch_out
    expect(subject.in_journey).to be(false)
  end

  it 'should not be able to touch in if the balance is below the minimum allowed amount' do
    minimum_balance = Oystercard::MINIMUM_LIMIT
    expect{ subject.touch_in(station) }.to raise_error("Your balance needs to be above #{minimum_balance}")
  end

  it 'should reduce the balance when touching out' do
    subject.top_up(2.00)
    subject.touch_in (station)
    subject.touch_out
    expect(subject.balance).to equal(2 - Oystercard::MINIMUM_LIMIT)
  end

  it 'should remember the touch in station' do
    subject.top_up(2.00)
    subject.touch_in(station)
    expect(subject.start_station).to eq(station)
  end

  it 'should forget the touch in station when touching out' do
    subject.top_up(2.00)
    subject.touch_in(station)
    subject.touch_out
    expect(subject.start_station).to eq(nil)
  end

  

end
