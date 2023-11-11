class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def meow
    "Meow, my name is #{@name}"
  end
end

describe "ampersand operator" do
  let(:cat) { Cat.new("Kitty") }

  it "can be used to call a method" do
    expect(cat.send(:meow)).to eq("Meow, my name is Kitty")
  end

  context "combine with map" do
    let(:cats) { [Cat.new("Kitty"), Cat.new("Pepper")] }

    it "can be used to call a method on each element" do
      expect(cats.map(&:name)).to eq(["Kitty", "Pepper"])
    end
  end
end