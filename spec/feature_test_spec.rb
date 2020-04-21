# frozen_string_literal: true

require 'account'
require 'timecop'

describe 'feature test' do
  it 'can create an account' do
    expect { Account.new }.not_to raise_error
  end

  context 'account features' do
    before(:each) do
      @account = Account.new
    end

    it 'can make a deposit to the account' do
      Timecop.freeze(Time.local(2020, 4, 19)) do
        @account.deposit(10)
        expect(@account.instance_variable_get(:@transactionController).history[0].date).to eq '2020-04-19'
        expect(@account.instance_variable_get(:@transactionController).history[0].credit).to eq 10
        expect(@account.instance_variable_get(:@transactionController).history[0].debit).to eq ''
        expect(@account.instance_variable_get(:@transactionController).history[0].balance).to eq 10
      end
    end

    it 'can make a withdrawal from the account' do
        Timecop.freeze(Time.local(2020, 4, 19)) do
            @account.withdraw(10)
            expect(@account.instance_variable_get(:@transactionController).history[0].date).to eq '2020-04-19'
            expect(@account.instance_variable_get(:@transactionController).history[0].credit).to eq ''
            expect(@account.instance_variable_get(:@transactionController).history[0].debit).to eq(-10)
            expect(@account.instance_variable_get(:@transactionController).history[0].balance).to eq(-10)      
        end
    end

    it 'can view a statement from the account' do
      Timecop.freeze(Time.local(2020, 4, 19)) do
        @account.deposit(10)
        @account.withdraw(10)
        @account.deposit(100)
        expect { @account.statement }.to output("date || credit || debit || balance\n2020-04-19 || 100.00 ||  || 100.00\n2020-04-19 ||  || -10.00 || 0.00\n2020-04-19 || 10.00 ||  || 10.00\n").to_stdout
      end
    end
  end
end
