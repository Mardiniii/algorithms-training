require_relative "./quicksort"

describe "#quicksort" do
  subject { quicksort(array) }

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

describe '#alternate_quicksort' do
  let(:empty_array) { [ ] }
  let(:array_one) { [3] }
  let(:array_two) { [5, 3] }
  let(:array_three) { [8, 5, 3] }
  let(:array_four) { [9, 16, 8, 5, 3, 21, 17, 14] }

  it "is organizing correctly different array sizes" do
    expect(alternate_quicksort(array_one)).to eq [3]
    expect(alternate_quicksort(array_two)).to eq [3, 5]
    expect(alternate_quicksort(array_three)).to eq [3, 5, 8]
    expect(alternate_quicksort(array_four)).to eq [3, 5, 8, 9, 14, 16, 17, 21]
  end

  it "it works correctly when receive an empty array" do
    expect(alternate_quicksort(empty_array)).to eq []
  end
end
