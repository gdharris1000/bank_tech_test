# frozen_string_literal: true

require_relative './transaction'

class TransactionController
  attr_reader :history

  def initialize(transaction_class = Transaction)
    @history = []
    @transaction = transaction_class
  end

  def addToHistory(value)
    @history.push(createTransaction(value))
  end

  def createTransaction(value)
    if value >= 0
      @transaction.new(credit: value, debit: '', balance: calcBalance(value))
    else
      @transaction.new(credit: '', debit: value, balance: calcBalance(value))
    end
  end

  def calcBalance(value)
    if !@history.empty?
      @history.last.balance + value
    else
      value
    end
  end
end
