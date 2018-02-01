require 'pry'

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.valid? && @status == 'pending' && @sender.balance > @amount
      receiver.deposit(amount)
      sender.balance -= amount
      @status = 'complete'
    else
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      receiver.deposit(-amount)
      sender.deposit(amount)
      @status = 'reversed'
    end
  end




end
