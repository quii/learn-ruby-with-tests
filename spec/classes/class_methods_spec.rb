class Deposit
  attr_reader :to, :amount
  def initialize(to, amount)
    @to = to
    @amount = amount
  end

  def Deposit.summary(*deposits)
    deposits.reduce({}) do |summary, deposit|
      summary[deposit.to] ||= 0
      summary[deposit.to] += deposit.amount
      summary
    end
  end

  def self.richest_person(*deposits)
    Deposit.summary(*deposits)
           .max_by { |person, amount| amount }.first
  end

end

describe Deposit do
  # let deposits be an array of deposits, 3 deposits for chris, 2 for john
  let(:deposits) { [
    Deposit.new("Chris", 100),
    Deposit.new("Chris", 200),
    Deposit.new("Chris", 300),
    Deposit.new("John", 100),
    Deposit.new("John", 200)]
  }

  it "can calculate the total deposits for each person" do
    expect(Deposit.summary(*deposits)).to eq({"Chris" => 600, "John" => 300})
  end

  it "can calculate the richest person" do
    expect(Deposit.richest_person(*deposits)).to eq("Chris")
  end
end