class Transaction

    attr_reader :date, :credit, :debit, :balance

    def initialize(credit:, debit:, balance:)
        @date = Date.today.to_s
        @credit = credit
        @debit = debit
        @balance = balance
    end

end