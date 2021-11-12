require_relative "./selection_sort"

describe "#find_smallest_element_index" do
  subject { find_smallest_element_index(array) }

  context "when the array if empty" do
    let(:array) { [] }

    it { is_expected.to be_nil }
  end

  context "when the array is not empty" do
    context "when the array has duplicates" do
      let(:array) { [16, 3, 3, 3, 5, 47, 54] }

      it { is_expected.to eq(1) }
    end

    context "when the array doesn't have duplicates" do
      let(:array) { [16, 39, 47, 478, 5] }

      it { is_expected.to eq(4) }
    end
  end
end

describe "#selection_sort" do
  subject { selection_sort(array) }

  context "when the array if empty" do
    let(:array) { [] }

    it { is_expected.to eq([]) }
  end

  context "when the array is not empty" do
    context "when the array has duplicates" do
      let(:array) { [16, 3, 3, 3, 5, 47, 54] }

      it { is_expected.to eq([3, 3, 3, 5, 16, 47, 54]) }
    end

    context "when the array doesn't have duplicates" do
      let(:array) { [10, 9, 8, 7, 6, 5, 4, 3, 2, 1] }

      it { is_expected.to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) }
    end
  end
end
