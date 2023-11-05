class Repeater
  def initialize(times)
    @times = times
  end

  def repeat(word)
    word * @times
  end
end

class Repeat3Times
  def initialize
    @repeater = Repeater.new(3)
  end
  def repeat(word)
    @repeater.repeat(word)
  end
end

class MapRepeater
  def repeat(word)
    1.upto(3).map { word }.join
  end
end

shared_examples "a repeater" do
  it "should repeat the word 3 times" do
    expect(subject.repeat("Hello")).to eq("HelloHelloHello")
    expect(subject.repeat("Goodbye")).to eq("GoodbyeGoodbyeGoodbye")
  end
end

describe Repeater, "with repeat set to 3" do
  subject { Repeater.new(3) }
  it_behaves_like "a repeater"
end

# notice you don't have to init the subject, it just calls .new for you
describe Repeat3Times do
  it_behaves_like "a repeater"
end

describe MapRepeater do
  it_behaves_like "a repeater"
end

