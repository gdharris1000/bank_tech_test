require 'transaction'

describe Transaction do
    it 'receives credit, debit and balance values on initialisation' do
        @transaction = Transaction.new(credit: 1, debit: "", balance: 1)
        expect(@transaction.credit).to eq 1
        expect(@transaction.debit).to eq ""
        expect(@transaction.balance).to eq 1
    end
end