describe 'feature test' do
    it 'can create an account' do
        expect(Account.new).not_to raise_error
    end

    describe 'account features'
        before(:each) do
            @account = Account.new
        end

        it 'can make a deposit to the account' do
            
        end

        it 'can make a withdrawal from the account' do
            
        end

        it 'can view a statement from the account' do
            
        end
    end
end