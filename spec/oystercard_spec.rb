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

end
