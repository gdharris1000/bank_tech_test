class Statement

    def initialize(history)
        @history = history
    end

    def generate
        statementText = "date || credit || debit || balance\n"

        @history.reverse.each do |h|
            credit = h.credit != "" ? ('%.2f' % h.credit.to_f) : ""
            debit = h.debit != "" ? ('%.2f' % h.debit.to_f) : ""
            statementText += "#{h.date} || #{credit} || #{debit} || #{'%.2f' % h.balance.to_f}\n"
        end
        
        return statementText
    end


end