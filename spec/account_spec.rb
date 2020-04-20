require 'account'

describe Account do

    before(:each) do
        @account = Account.new
        
    end

    it 'returns empty statement when there are no transactions' do
      expect(@account.statement).to eq 'date || credit || debit || balance'
    end

    it 'has a starting balance of 0' do
        expect(@account.instance_variable_get(:@balance)).to eq 0
    end

    it 'has a starting history of []' do
        expect(@account.instance_variable_get(:@history)).to eq []
    end

    describe 'deposit' do

        it 'deposit adds deposit amount to balance' do
            @account.deposit(10)
            expect(@account.instance_variable_get(:@balance)).to eq 10
        end

        it 'each disposit is added to the history' do
            allow(Date).to receive(:today).and_return Date.new(2020,4,20)
            @account.deposit(10)
            expect(@account.instance_variable_get(@history)).to eq [{date: 2020/4/20, credit: 10, debit: 0, balance: 10}]
        end

    end
    

end