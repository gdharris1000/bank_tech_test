# frozen_string_literal: true

require 'date'
require_relative './transaction_controller'
require_relative './statement'

class Account
  def initialize
    @transactionController = TransactionController.new
  end

  def deposit(amount)
    @transactionController.addToHistory(amount)
  end

  def withdraw(amount)
    @transactionController.addToHistory(-amount)
  end

  def statement
    statement = Statement.new(@transactionController.history)
    puts statement.generate
  end
end
