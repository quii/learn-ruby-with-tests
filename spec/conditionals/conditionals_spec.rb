def stroke_pepper?(mood)
  unless mood == "angry"
    true
  end
end

describe "unless" do
  subject { stroke_pepper?(mood) }

  context "when pepper is angry" do
    let(:mood) { "angry" }
    it { is_expected.to be_falsey }
  end

  context "when pepper is not angry" do
    let(:mood) { "happy" }
    it { is_expected.to be_truthy }
  end
end