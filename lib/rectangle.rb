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