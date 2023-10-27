require_relative '../../lib/rectangle.rb'
require_relative '../../lib/circle.rb'

describe "Shapes" do

  matcher :have_area do |expected|
    match { |subject| subject.area == expected}
  end

  matcher :have_perimeter do |expected|
    match { |subject| subject.perimeter == expected}
  end

  describe Rectangle do
    subject { Rectangle.new(2, 3) }

    context "#perimeter" do
      it "returns the correct perimeter" do
        expect(subject).to have_perimeter(10)
      end
    end

    context "#area" do
      it "returns the correct area" do
        expect(subject).to have_area(6)
      end
    end
  end

  describe Circle do
    subject { Circle.new(2) }

    context "#perimeter" do
      it "returns the correct perimeter" do
        expect(subject.perimeter).to eq(12.566370614359172)
      end
    end

    context "#area" do
      it "returns the correct area" do
        expect(subject).to have_area(12.566370614359172)
      end
    end
  end
end
