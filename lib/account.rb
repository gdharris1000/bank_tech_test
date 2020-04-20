class Account

    def initialize
        @balance = 0
        @history = []
    end

    def statement
        return 'date || credit || debit || balance'
    end

    def deposit(amount)
        @balance = @balance + amount
        @history.push({date: Date.today.to_s, credit: amount, debit: 0, balance: @balance})
    end

end