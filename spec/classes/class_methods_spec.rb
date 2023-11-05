class Deposit
  attr_reader :to, :amount
  def initialize(to, amount)
    @to = to
    @amount = amount
  end

  def Deposit.summary(*deposits)
    blah = deposits.reduce(Hash.new(0)) do |summary, deposit|
      summary[deposit.to] += deposit.amount
      summary
    end
    blah.map { |name, amount| Balance.new(name, amount) }
  end
end

class Balance
  attr_reader :amount, :name
  def initialize(name, amount)
    @name = name
    @amount = amount
  end

  def self.richest(*balance)
    balance.max_by(&:amount).name
  end

  def ==(other)
    other.name == name && other.amount == amount
  end
end

describe "Deposit and balances" do
  let(:deposits) { [
    Deposit.new("Chris", 100),
    Deposit.new("Chris", 200),
    Deposit.new("Chris", 300),
    Deposit.new("John", 100),
    Deposit.new("John", 200)]
  }

  it "can calculate the total deposits for each person" do
    expect(Deposit.summary(*deposits)).to eq([
      Balance.new("Chris", 600),
      Balance.new("John", 300)
    ])
  end

  it "can calculate the richest person" do
    balances = Deposit.summary(*deposits)
    expect(Balance.richest(*balances)).to eq("Chris")
  end
end