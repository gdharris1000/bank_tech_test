# frozen_string_literal: true

require 'account'

describe Account do
  context 'initialise' do
    it 'creates a new transaction controller on initialisation' do
      account = Account.new
      expect(account.instance_variable_get(:@transactionController)).to be_a TransactionController
    end
  end

  context 'methods' do
    before(:each) do
      transaction1 = instance_double('Transaction', date: '2020/04/01', credit: 10, debit: '', balance: 10)
      @controller_double = double('TransactionController', addToHistory: 'added to history', history: [transaction1])
      @account = Account.new(@controller_double)
    end

    it 'returns a statement' do
      statement_double = double('Statement', generate: "date || credit || debit || balance\n2020/04/01 || 10.00 ||  || 10.00\n")
      expect { @account.statement(statement_double) }.to output("date || credit || debit || balance\n2020/04/01 || 10.00 ||  || 10.00\n").to_stdout
    end

    context 'deposit and withdraw' do
      it 'user can deposit a value' do
        expect(@account.deposit(10)).to eq 'added to history'
      end

      it 'user can withdraw a value' do
        expect(@account.withdraw(10)).to eq 'added to history'
      end
    end
  end
end
