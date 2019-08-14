require "fibonacci_sum"

RSpec.describe FibonacciSum do
  describe ".even_sums" do
    it "returns the correct sum" do
      expect(described_class.even_sums(ceiling: 1000)).to eq 798
    end
  end
end
