require 'oystercard'

describe Oystercard do

  it 'should have an initial balance' do
    expect(subject.balance).to equal(0)
  end

  it 'should be able to top up to increase the balance' do
    subject.top_up(1.00)
    expect(subject.balance).to equal (1.00)
  end

end
