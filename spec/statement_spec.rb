require 'statement'

describe Statement do

    before(:each) do
        transaction1 = instance_double("Transaction", :credit => 10, :debit => "", :balance => 10)
        transaction2 = instance_double("Transaction", :credit => "", :debit => 1, :balance => 9)
        history = [transaction1, transaction2]
        @statement = Statement.new(history)
    end

    it 'generateStatement returns header text' do
        expect(@statement.generate).to eq "date || credit || debit || balance\n"
    end

end