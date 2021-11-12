require_relative "./find_greatest_element"

describe "#find_greatest_element" do
  subject { find_greatest_element(array) }

  context "when the array is empty" do
    let(:array) { [] }

    it { is_expected.to be_nil }
  end

  context "when the array has one element" do
    let(:array) { [16] }

    it { is_expected.to eq(16) }
  end

  context "when the array has more than one element" do
    let(:array) { [1, 2, 3, 4, 5, 6] }

    it { is_expected.to eq(6) }
  end
end
