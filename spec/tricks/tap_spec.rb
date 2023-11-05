describe "tap" do
  subject { thing.tap(&block) }

  context "when thing is a string" do
    let(:thing) { "some string" }
    let(:block) { proc { |thing| thing.reverse } }

    it {is_expected.to eq(thing)}
  end

  context "when thing is an array" do
    let(:thing) { [1, 2, 3] }
    let(:block) { proc { |thing| thing.size } }

    it {is_expected.to eq(thing)}
  end
end