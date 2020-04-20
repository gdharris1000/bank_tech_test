# frozen_string_literal: true

require 'date'
class Account
  def initialize
    @balance = 0
    @history = []
  end

  def statement
    statement_text = "date || credit || debit || balance\n"

    @history.each do |h|
      statement_text += "#{h[:date]} || #{h[:credit]} || #{h[:debit]} || #{h[:balance]}\n"
    end
    puts statement_text
  end

  def deposit(amount)
    @balance += amount
    @history.push({ date: Date.today.to_s, credit: amount, debit: 0, balance: @balance })
  end

  def withdraw(amount)
    @balance -= amount
    @history.push({ date: Date.today.to_s, credit: 0, debit: amount, balance: @balance })
  end
end
