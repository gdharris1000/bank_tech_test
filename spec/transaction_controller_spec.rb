# frozen_string_literal: true

require 'transaction_controller'

describe TransactionController do
  before(:each) do
    @transactionController = TransactionController.new
  end

  it 'initialises with an empty history array' do
    expect(@transactionController.history).to eq []
  end

  it 'calculate balance' do
    transaction1 = instance_double('Transaction', balance: 10)
    @transactionController.instance_variable_set(:@history, [transaction1])
    expect(@transactionController.calcBalance(5)).to eq 15
  end

  it 'creates a transaction' do
    expect(@transactionController.createTransaction(2)).to be_a Transaction
  end

  it 'add transaction to history' do
    transaction1 = instance_double('Transaction', credit: 10, debit: '', balance: 10)
    @transactionController.stub(:createTransaction) { transaction1 }
    @transactionController.addToHistory(10)
    expect(@transactionController.history.length).to eq 1
  end
end
