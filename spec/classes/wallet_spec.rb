
class Wallet
  attr_reader :balance

  def initialize(balance)
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise InsufficientFundsError if amount > @balance
    @balance -= amount
  end
end

class InsufficientFundsError < StandardError; end

RSpec.

describe Wallet do
  subject { Wallet.new(10) }

  context "when created" do
    it "should have a balance of 10" do
      expect(subject.balance).to eq(10)
    end
  end

  context "when depositing" do
    it "should increase the balance" do
      subject.deposit(10)
      expect(subject.balance).to eq(20)
    end
  end

  context "when withdrawing" do
    it "should decrease the balance" do
      subject.withdraw(10)
      expect(subject.balance).to eq(0)
    end
  end

  context "when withdrawing too much" do
    it "should raise an error" do
      expect { subject.withdraw(11) }.to raise_error(InsufficientFundsError)
    end
  end
end