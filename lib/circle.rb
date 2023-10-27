class Circle
  def initialize(radius)
    @radius = radius
  end

  def perimeter
    2 * Math::PI * @radius
  end

  def area
    Math::PI * @radius ** 2
  end
end