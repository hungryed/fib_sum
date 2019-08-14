require 'optparse'
require 'ostruct'

module FibonacciSum
  class Cli
    class ConfigurationOptions
      attr_reader :args

      def initialize(args)
        @original_arguments = args
        @args = args.dup
      end

      def ceiling
        parsed_args.ceiling
      end

      def parse_args
        option_parser.parse(args)
      end

      private

      def parsed_args
        @parsed_args ||= OpenStruct.new
      end

      def option_parser
        @option_parser ||= OptionParser.new do |parser|
          parser.banner = "Usage: ./bin/runner\n"

          parser.on("--ceiling=COUNT", Integer, "specify ceiling") do |ceiling|
            parsed_args.ceiling = ceiling
          end
        end
      end
    end
  end
end

