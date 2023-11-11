module BadBank
  class InsufficientFundsError < StandardError; end

  class Wallet
    attr_reader :balance

    def initialize(balance)
      @balance = balance
    end

    def ==(other)
      @balance == other.balance
    end

    def deposit(amount)
      @balance += amount
    end

    def +(amount)
      deposit(amount)
    end

    def withdraw(amount)
      raise InsufficientFundsError if amount > @balance
      @balance -= amount
    end

    def -(amount)
      withdraw(amount)
    end
  end
end
