class Statement

    def initialize(history)
        @history = history
    end

    def generate
        header = "date || credit || debit || balance\n"
        return header
    end
end