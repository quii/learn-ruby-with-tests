def high_five
  yield "high"
  yield "five"
end

describe "yield" do
  it "calls the block for each yield in high_five" do
    mySpy = spy("mySpy")
    high_five { |thing| mySpy.call(thing) }
    expect(mySpy).to have_received(:call).with("high")
    expect(mySpy).to have_received(:call).with("five")
  end
end