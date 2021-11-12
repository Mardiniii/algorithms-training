require_relative "./sum_function"

describe "#sum_function" do
  subject { sum_function(array) }

  context "when the array is empty" do
    let(:array) { [] }

    it { is_expected.to eq(0) }
  end

  context "when the array has one element" do
    let(:array) { [6] }

    it { is_expected.to eq(6) }
  end

  context "when the array has more than one element" do
    let(:array) { [1, 2, 3, 4, 5, 6] }

    it { is_expected.to eq(21) }
  end
end
