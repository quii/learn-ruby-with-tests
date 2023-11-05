class OrderedBalance
  include Comparable

  attr_reader :amount, :name
  def initialize(name, amount)
    @name = name
    @amount = amount
  end

  def <=>(other)
    amount <=> other.amount
  end
end

describe OrderedBalance do
  let(:rich) { OrderedBalance.new("Chris", 100) }
  let(:also_rich) { OrderedBalance.new("Pepper", 100) }
  let(:modest) { OrderedBalance.new("Alice", 50) }
  let(:poor) { OrderedBalance.new("John", 10) }

  it "can be compared to other balances" do
    expect(rich).to be > poor
    expect(poor).to be < rich
    expect(rich).to be == also_rich
    expect(modest).to be_between(poor, rich)
  end
end