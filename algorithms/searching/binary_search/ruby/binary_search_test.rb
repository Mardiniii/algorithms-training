require_relative "./binary_search"

describe "#binary_search" do
  it "returns the index when the target is in the array" do
    array = (1..24000).to_a
    target = 15_768

    result = binary_search(array, target)

    expect(result).to eq(15_767)
  end

  it "returns the index when the target is in the array" do
    array = (0..250).to_a
    target = 3

    result = binary_search(array, target)

    expect(result).to eq(3)
  end

  it "returns nil when the target is not in the array" do
    array = (0..250).to_a
    target = 312

    result = binary_search(array, target)

    expect(result).to be_nil
  end
end
