class TransactionController
    attr_reader :history

    def initialize
        @history = []
    end

    def addToHistory(value)
        @history.push(createTransaction(value))
    end

    def createTransaction(value)
        if value >= 0
            return Transaction.new(credit: value, debit: "", balance: calcBalance(value))
        else
            return Transaction.new(credit: "", debit: value, balance: calcBalance(-(value)))
        end
    end

    def calcBalance(value)
        if @history.length > 0
            return @history.last.balance + value
        else
            return value
        end
    end

end