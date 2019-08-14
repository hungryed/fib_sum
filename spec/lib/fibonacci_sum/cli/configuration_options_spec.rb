require "fibonacci_sum"

RSpec.describe FibonacciSum::Cli::ConfigurationOptions do
  let(:args) { [] }
  subject { described_class.new(args) }

  describe "#ceiling" do
    before :each do
      subject.parse_args
    end

    it "returns nil if no ceiling is specified" do
      expect(subject.ceiling).to eq nil
    end

    context "with a ceiling" do
      let(:args) { ["--ceiling=9001"] }

      it "returns the ceiling specified in the arguments" do
        expect(subject.ceiling).to eq 9001
      end
    end
  end
end
