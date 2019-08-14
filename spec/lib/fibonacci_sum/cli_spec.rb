require "fibonacci_sum"

RSpec.describe FibonacciSum::Cli do
  let(:args) { [] }
  subject { described_class.new(*args) }
  original_stderr = $stderr
  original_stdout = $stdout

  before :each do
    $stderr = File.open(File::NULL, "w")
    $stdout = File.open(File::NULL, "w")
  end

  after :each do
    $stderr = original_stderr
    $stdout = original_stdout
  end

  describe ".even_sums" do
    let(:dub) { instance_double(described_class, even_sums: "ran") }

    it "delegates to an instance" do
      expect(described_class).to receive(:new).with("some args").and_return(dub)
      expect(dub).to receive(:even_sums)
      expect(described_class.even_sums(["some args"])).to eq "ran"
    end
  end

  describe "#even_sums" do
    it "retrieves the sum with the default ceiling" do
      expect(FibonacciSum).to receive(:even_sums).with(ceiling: 4_000_000)
      subject.even_sums
    end

    context "with provided arguments" do
      let(:args) { ["--ceiling=1000"] }

      it "retrieves the sum for the specified ceiling" do
        expect(FibonacciSum).to receive(:even_sums).with(ceiling: 1000)
        subject.even_sums
      end
    end
  end
end
