require "fibonacci_sum"

RSpec.describe FibonacciSum::ListBuilder do
  subject { described_class.new }

  before :each do
    described_class.clear!
  end

  after :each do
    described_class.clear!
  end

  describe ".build_list_until" do
    let(:dub) { instance_double(described_class) }

    before :each do
      allow(described_class).to receive(:new).and_return(dub)
    end

    it "delegates to an instance" do
      expect(dub).to receive(:build_list_until).with(ceiling: 1000).
        and_return("list built")
      expect(described_class.build_list_until(ceiling: 1000)).to eq "list built"
    end
  end

  describe "#build_list_until" do
    it "builds the list of fibonacci numbers until the ceiling is met" do
      expect(subject.build_list_until(ceiling: 1000)).to eq({
        0 => 1,
        1 => 2,
        2 => 3,
        3 => 5,
        4 => 8,
        5 => 13,
        6 => 21,
        7 => 34,
        8 => 55,
        9 => 89,
        10 => 144,
        11 => 233,
        12 => 377,
        13 => 610,
        14 => 987
      })
    end

    it "does nothing if the ceiling is lower than the default list" do
      expect(subject.build_list_until(ceiling: 1)).to eq({
        0 => 1,
        1 => 2,
        2 => 3,
        3 => 5,
        4 => 8,
        5 => 13,
        6 => 21,
        7 => 34,
        8 => 55,
        9 => 89,
      })
    end

    it "yields values to a block if provided one" do
      yielded_numbers = []
      subject.build_list_until(ceiling: 35) { |value| yielded_numbers << value }
      expect(yielded_numbers).to eq([1, 2, 3, 5, 8, 13, 21, 34])
    end
  end
end
