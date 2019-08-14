require_relative "./cli/configuration_options"

module FibonacciSum
  class ListBuilder
    LIST = [
      1,
      2,
      3,
      5,
      8,
      13,
      21,
      34,
      55,
      89,
    ].freeze

    class << self
      def build_list_until(**opts, &blk)
        instance.build_list_until(**opts, &blk)
      end

      def instance
        @instance ||= new
      end

      def clear!
        @instance = nil
      end
    end

    def build_list_until(ceiling:)
      validate_ceiling!(ceiling)
      ceiling = ceiling.to_f
      index = 0
      value = table_by_index[index]
      while value < ceiling
        value = table_by_index[index] || calculate_value_at(index)

        unless value >= ceiling
          table_by_index[index] = value
          yield(value) if block_given?
        end
        index += 1
      end
      table_by_index
    end

    private

    def validate_ceiling!(ceiling)
      if ceiling.to_i <= 0
        raise Errors::InvalidNumberError.new("Number must be greater than 0. You provided: #{ceiling}")
      end
    end

    def calculate_value_at(index)
      table_by_index[index - 1] + table_by_index[index - 2]
    end

    def table_by_index
      @table_by_index ||= LIST.each_with_index.with_object({}) do |(num, index), memo|
        memo[index] = num
      end
    end
  end
end
