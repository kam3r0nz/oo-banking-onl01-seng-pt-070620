require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    # binding.pry
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    # binding.pry
    if @status == "pending" && @sender.balance > @amount && valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end


end
