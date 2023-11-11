class Score
  def Score.max
    100
  end
end

describe "singleton methods" do
  it "can be defined on a class" do
    expect(Score.max).to eq(100)
  end
end