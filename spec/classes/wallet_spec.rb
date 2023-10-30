require_relative '../../lib/bank/bank.rb'

describe "Bad bank" do
  subject { BadBank::Wallet.new(10) }

  matcher :have_balance do |expected|
    match { |subject| subject.balance == expected}
  end

  context "when created" do
    it "should have an initial balance of 10 for these tests" do
      expect(subject).to have_balance(10)
    end
  end

  context "when depositing" do
    it "should increase the balance" do
      subject.deposit(10)
      expect(subject).to have_balance(20)
    end
  end

  context "when withdrawing" do
    it "should decrease the balance" do
      subject.withdraw(10)
      expect(subject).to have_balance(0)
    end
  end

  context "when withdrawing too much" do
    it "should raise an error" do
      expect { subject.withdraw(11) }.to raise_error(BadBank::InsufficientFundsError)
    end
  end

  context "two wallets with the same balance are equal" do
    it "is not a bank you should work with tbh" do
      expect(subject).to eq(BadBank::Wallet.new(10))
    end
  end
end