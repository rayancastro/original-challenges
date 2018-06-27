require_relative 'transaction.rb'

# This is how you define your own custom exception classes
class DepositError < StandardError
end

class BankAccount
  attr_reader :name
  attr_reader :balance
  # Contract for the BankAccount class
  # - you can access full owner's name and balance, but partial IBAN
  # - you cannot access full IBAN
  # - you can print partial account info
  # - you can print transactions only with a password
  # - you can withdraw or deposit money
  # - You can see the balance of the account (through the balance variable)

  MIN_DEPOSIT = 100

  def initialize(name, iban, initial_deposit, password)
    fail DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT

    @password     = password
    @transactions = []
    @balance      = 0
    @name         = name
    @iban         = iban

    add_transaction(initial_deposit)
  end

  def withdraw(amount)
    # TODO: Call add_transaction with the right argument
    # TODO: returns a string with a message
    raise DepositError if amount > @balance
    add_transaction(-amount)
    return "You withdraw $#{format('%.2f', amount)}."
  end

  def deposit(amount)
    # TODO: Call add_transaction with the right argument
    # TODO: returns a string with a message
    add_transaction(amount)
    return "You deposited $#{format('%.2f', amount)}."
  end

  def password_check(password)
    if !@password.empty?
      return password == @password
    else
      return true
    end
  end

  def transactions_history(args = { password: "" })
    # TODO: Check if there is a password and if so if it is correct
    # TODO: return a string displaying the transactions, BUT NOT return the transaction array!
    return "no password given" if args[:password] == ""
    if password_check(args[:password])
      transaction_str = "------Transaction history---------\n"
      @transactions.each do |transaction|
        transaction_str = transaction.to_s + "\n" + "----------------------------------\n"
      end
      return transaction_str
    else
      return "wrong password"
    end
  end

  def iban
    data = @iban.match(/^(?<first>.{4})-(?<hide>.+)-(?<last>.+)$/)
    partial_iban = data[:first] + data[:hide].delete("-").gsub(/./, "*") + data[:last]
    return partial_iban
    # TODO: Hide the middle of the IBAN like FR14**************606 and return it
  end

  def to_s
    # Method used when printing account object as string (also used for string interpolation)
    # TODO: return a string with the account owner, the hidden iban and the balance of the account
    return "Account Owner: #{@name}\n IBAN: #{iban}\n Balance: #{@balance}"
  end

  private

  def add_transaction(amount)
    # TODO: add the amount in the transactions array
    # TODO: update the current balance (which represents the balance of the account)
    @transactions.push(Transaction.new(amount))

    @balance += amount
  end
end
