require_relative '../../lib/bank/bank.rb'

describe "Bad bank" do
  subject { BadBank::Wallet.new(10) }

  matcher :have_balance do |expected|
    match { |subject| subject.balance == expected}
  end

  context "when created" do
    it { is_expected.to have_balance(10)}
  end

  context "when depositing" do
    before { subject.deposit(10) }
    it { is_expected.to have_balance(20)}
  end

  context "when depositing with +" do
    before { subject + 10 }
    it { is_expected.to have_balance(20)}
  end

  context "when withdrawing" do
    before { subject.withdraw(10) }
    it { is_expected.to have_balance(0)}
  end

  context "when withdrawing with -" do
    before { subject - 10 }
    it { is_expected.to have_balance(0)}
  end

  context "when withdrawing too much" do
    it "should raise an error" do
      expect { subject.withdraw(11) }.to raise_error(BadBank::InsufficientFundsError)
    end
  end

  context "using comparable" do
    it "can compare two wallets" do
      expect(subject).to be > BadBank::Wallet.new(5)
    end
    it "is not a bank you should work with tbh" do
      expect(subject).to eq(BadBank::Wallet.new(10))
    end
  end
end