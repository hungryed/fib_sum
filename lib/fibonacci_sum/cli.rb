require_relative "./cli/configuration_options"

module FibonacciSum
  class Cli
    DEFAULT_CEILING = 4_000_000.freeze
    attr_reader :args

    class << self
      def run(args)
        new(*args).run!
      end
    end

    def initialize(*args)
      @args = args
    end

    def run!
      arg_parser.parse_args
      p FibonacciSum.even_sums(
        ceiling: ceiling
      )
    end

    private

    def ceiling
      arg_parser.ceiling || DEFAULT_CEILING
    end

    def arg_parser
      @arg_parser ||= ConfigurationOptions.new(args)
    end
  end
end
