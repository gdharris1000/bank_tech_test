# frozen_string_literal: true

require 'statement'

describe Statement do
  before(:each) do
    transaction1 = instance_double('Transaction', date: '2020/04/18', credit: 10, debit: '', balance: 10)
    transaction2 = instance_double('Transaction', date: '2020/04/20', credit: '', debit: 1, balance: 9)
    history = [transaction1, transaction2]
    @statement = Statement.new(history)
  end

  it 'generate returns header text' do
    statement = Statement.new([])
    expect(statement.generate).to eq "date || credit || debit || balance\n"
  end

  it 'generate turns history array into a string' do
    expect(@statement.generate).to eq "date || credit || debit || balance\n2020/04/20 ||  || 1.00 || 9.00\n2020/04/18 || 10.00 ||  || 10.00\n"
  end
end
