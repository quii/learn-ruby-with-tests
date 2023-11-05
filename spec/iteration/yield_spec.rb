def high_five
  yield "high"
  yield "five"
end

describe "yield" do
  it "calls the block for each yield in high_five" do
    my_spy = spy("my_spy")
    high_five { |thing| my_spy.call(thing) }
    expect(my_spy).to have_received(:call).with("high")
    expect(my_spy).to have_received(:call).with("five")
  end
end