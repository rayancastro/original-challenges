class VendingMachine
  # TODO: add relevant getter/setter to this class to make the scenarios work properly.
  attr_reader :amount_cents
  attr_reader :snacks
  attr_reader :snack_price_cents


  def initialize(snack_price_cents, snacks, password = "")
    @amount_cents = 0
    @snacks = snacks
    @snack_price_cents = snack_price_cents
    @password = password
  end

  def insert_coin(value_cents)
    # TODO: what happens to @snacks, @amount_cents and @snack_price_cents
    # when the user inserts a coin?
    @amount_cents += value_cents
  end

  def buy_snack
    # TODO: what happens to @snacks, @amount_cents and @snack_price_cents
    # when the user pushes a button to buy a Snack?

    if @snacks < 1
      puts "Sorry. The machine is out of snacks"
    elsif @amount_cents < @snack_price_cents
      puts "Sorry. You dont have enough credit. Try inserting some coins"
    else
      @amount_cents -= @snack_price_cents
      @snacks -= 1
      puts "Here is your snack!"
    end
  end

  def refill(amount, password = "")
    refill_snacks(amount) if password == @password
  end

  private

  def refill_snacks(amount)
    @snacks += amount
  end
end
