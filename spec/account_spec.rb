require 'account'
require 'timecop'

describe Account do
  before(:each) do
    @account = Account.new
  end

  it 'creates a new transaction controller on initialisation' do
    expect(@account.instance_variable_get(:@transactionController)).to be_a TransactionController
  end

  it 'returns a statement' do
    transaction1 = instance_double("Transaction", :date => "2020/04/01", :credit => 10, :debit => "", :balance => 10)
    controller_double = instance_double("TransactionController", :history => [transaction1])
    @account.instance_variable_set(:@transactionController, controller_double)
    expect{@account.statement}.to output("date || credit || debit || balance\n2020/04/01 || 10.00 ||  || 10.00\n").to_stdout
  end
  
  context 'deposit and withdraw' do

    before(:each) do
      controller_spy = spy("TransactionController")
    @account.instance_variable_set(:@transactionController, controller_spy)
    end
    
    it 'user can deposit a value' do
      expect{@account.deposit(10)}.not_to raise_error
    end
  
    it 'user can withdraw a value' do
      expect{@account.withdraw(10)}.not_to raise_error
    end
  end

end
