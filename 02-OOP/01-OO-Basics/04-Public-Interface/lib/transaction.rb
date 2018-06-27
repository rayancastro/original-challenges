# Optional
class Transaction
  def initialize(amount)
    # Initialize amount and date of transaction
    @amount = amount
    @time = Time.now
  end

  def to_s
    # Nicely print transaction info using Time#strftime.
    return "Transaction of $#{@amount} at #{@time.strftime('%A, %B %d, %H:%M:%S.')}"
  end
end
