require 'oystercard'

describe Oystercard do

  it 'should have an initial balance' do
    expect(subject.balance).to equal(0)
  end

end
