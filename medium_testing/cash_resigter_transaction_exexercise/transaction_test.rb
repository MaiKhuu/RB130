require "minitest/autorun"

require_relative "cash_register"
require_relative "transaction"

class TransactionTests < Minitest::Test

  def setup
    @main_register = CashRegister.new(20.00)
    @buy_bread = Transaction.new(3.50)
  end

  def test_prompt_for_payment_exact
    my_input = StringIO.new("3.50\n")
    assert_output nil do
      @buy_bread.prompt_for_payment(input: my_input)
    end
    assert_equal 3.50, @buy_bread.amount_paid
  end

  def test_prompt_for_payment_under
    my_input = StringIO.new("1\n" + "5\n")
    my_output = StringIO.new

    correct_output = <<~OUTPUT
      You owe $3.5.
      How much are you paying?
      That is not the correct amount. Please make sure to pay the full cost.
      You owe $3.5.
      How much are you paying?
    OUTPUT

    @buy_bread.prompt_for_payment(input: my_input, output: my_output)

    assert_equal correct_output, my_output.string
    assert_equal 5.00, @buy_bread.amount_paid
  end

  def test_prompt_for_payment_over
    my_input = StringIO.new("5\n")
    assert_output nil do
      @buy_bread.prompt_for_payment(input: my_input)
    end
    assert_equal 5.00, @buy_bread.amount_paid
  end

end