
class Rectangle
  def initialize(length, width)
    @length = length
    @width = width
  end

  def perimeter
    2 * (@length + @width)
  end

  def area
    @length * @width
  end
end

describe Rectangle do

  subject { Rectangle.new(2, 3) }

  context "#perimeter" do
    it "returns the correct perimeter" do
      expect(subject.perimeter).to eq(10)
    end
  end

  context "#area" do
    it "returns the correct area" do
      expect(subject.area).to eq(6)
    end
  end

end

##todo custom matchers?