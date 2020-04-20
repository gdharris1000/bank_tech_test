require 'account'
require 'timecop'

describe Account do

    before(:each) do
        @account = Account.new
        
    end

    it 'returns empty statement when there are no transactions' do
      expect(@account.statement).to eq "date || credit || debit || balance\n"
    end

    it 'has a starting balance of 0' do
        expect(@account.instance_variable_get(:@balance)).to eq 0
    end

    it 'has a starting history of []' do
        expect(@account.instance_variable_get(:@history)).to eq []
    end

    describe 'deposit' do

        it 'adds deposit amount to balance' do
            @account.deposit(10)
            expect(@account.instance_variable_get(:@balance)).to eq 10
        end

        it 'added to the history' do
            Timecop.freeze(Time.local(2020, 4, 19)) do
                @account.deposit(10)
                expect(@account.instance_variable_get(:@history)).to eq [{date: "2020-04-19", credit: 10, debit: 0, balance: 10}]
            end
        end

    end

    describe 'withdraw' do
        
        it 'subtracts deposit amount from balance' do
            @account.withdraw(10)
            expect(@account.instance_variable_get(:@balance)).to eq -10
        end

        it 'added to history' do
            Timecop.freeze(Time.local(2020, 4, 18)) do
                @account.withdraw(10)
                expect(@account.instance_variable_get(:@history)).to eq [{date: "2020-04-18", credit: 0, debit: 10, balance: -10}]
            end
        end

    end

    describe 'statement' do
        
        it 'returns the statement header with each item from the @history array' do
            @account.instance_variable_set(:@history, [{date: "2020-04-19", credit: 10, debit: 0, balance: 10}, {date: "2020-04-18", credit: 0, debit: 10, balance: 0}, {date: "2020-04-18", credit: 30, debit: 0, balance: 30}])
            expect(@account.statement).to eq "date || credit || debit || balance\n2020-04-19 || 10 || 0 || 10\n2020-04-18 || 0 || 10 || 0\n2020-04-18 || 30 || 0 || 30\n"
        end

    end
    

end