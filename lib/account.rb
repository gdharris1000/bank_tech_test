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
    end

end