require 'oystercard'

describe Oystercard do

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

  it 'should be able to deduct a value based on the fare paid' do
    subject.top_up(5.00)
    subject.deduct(2.30)
    expect(subject.balance).to equal(2.70)
  end

  it 'should initialize not being in a journey' do
    expect(subject.in_journey).to be(false)
  end

  it 'when it touches in, it should be in a journey' do
    subject.touch_in
    expect(subject.in_journey).to be(true)
  end

  it 'when it touches out, it should not be in a journey' do
    subject.touch_in
    subject.touch_out
    expect(subject.in_journey).to be(false)
  end

end
