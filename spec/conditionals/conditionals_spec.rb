def stroke_pepper?(mood)
  unless mood == "angry"
    true
  end
end

describe "should you stroke pepper" do
  subject { stroke_pepper?(mood) }

  matcher :should_stroke_her do
    match { |subject| subject == true }
  end

  context "pepper is angry" do
    let(:mood) { "angry" }
    it { is_expected.to_not should_stroke_her }
  end

  context "pepper is not angry" do
    let(:mood) { "happy" }
    it { is_expected.to should_stroke_her }
  end
end