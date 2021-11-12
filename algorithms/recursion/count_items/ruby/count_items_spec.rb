require_relative "./count_items"

describe "#count_items" do
  subject { count_items(array) }

  context "when the array is empty" do
    let(:array) { [] }

    it { is_expected.to eq(0) }
  end

  context "when the array has one element" do
    let(:array) { [6] }

    it { is_expected.to eq(1) }
  end

  context "when the array has more than one element" do
    let(:array) { [1, 2, 3, 4, 5, 6] }

    it { is_expected.to eq(6) }
  end
end
