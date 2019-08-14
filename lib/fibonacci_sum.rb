require_relative "./fibonacci_sum/errors"
require_relative "./fibonacci_sum/cli"
require_relative "./fibonacci_sum/list_builder"

module FibonacciSum
  class << self
    def even_sums(ceiling:)
      even_total = 0
      FibonacciSum::ListBuilder.build_list_until(ceiling: ceiling) do |value|
        even_total += value if value.even?
      end
      even_total
    end
  end
end
