require 'minitest/autorun'

require_relative "cash_register"
require_relative "transaction"

class RegisterTest < Minitest::Test

  def setup
    @buy_bread = Transaction.new(3.50)
    @buy_bread.amount_paid = 4.00
    @main_register = CashRegister.new(20.00)
  end

  def test_accept_money
    previous_amount = @main_register.total_money
    @main_register.accept_money(@buy_bread)
    assert_equal(previous_amount + @buy_bread.amount_paid, @main_register.total_money)
  end

  def test_change
    change_amount = @buy_bread.amount_paid - @buy_bread.item_cost
    assert_equal(change_amount, @main_register.change(@buy_bread))
  end

  def test_give_receipt
    assert_output ("You've paid $#{@buy_bread.item_cost}.\n") { @main_register.give_receipt(@buy_bread) }
  end

end
