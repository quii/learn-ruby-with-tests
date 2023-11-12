class Account
  attr_accessor :balance

  def initialize(balance)
    @balance = balance
  end

  def apply_bonus(&bonus)
    @balance += bonus.call(@balance)
  end
end

describe Account do
  subject { Account.new(100) }
  let(:bonus) { 0.1 }
  let(:expected_balance) { 110 }

  it "can apply a bonus" do
    subject.apply_bonus { |balance| balance * bonus }
    expect(subject.balance).to eq(expected_balance)
  end

  it "with a proc object" do
    bonusProc = Proc.new { |balance| balance * bonus }
    subject.apply_bonus(&bonusProc)
    expect(subject.balance).to eq(expected_balance)
  end

  it "with the lambda -> operator" do
    bonusLambda = ->(balance) { balance * bonus }
    subject.apply_bonus(&bonusLambda)
    expect(subject.balance).to eq(expected_balance)
  end

  it "with the lambda keyword" do
    bonusLambda = lambda { |balance| balance * bonus }
    subject.apply_bonus(&bonusLambda)
    expect(subject.balance).to eq(expected_balance)
  end

  context "methods as objects" do
    class Discounter
      def apply_bonus(balance)
        balance * 0.1
      end
    end

    it "can be used as a proc" do
      subject.apply_bonus(&Discounter.new.method(:apply_bonus))
      expect(subject.balance).to eq(expected_balance)
    end
  end
end
