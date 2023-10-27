
class Sum
  def sum(*numbers)
    numbers.inject(0) { |sum, number| sum + number }
  end
end

class Sum2
  def sum(*numbers)
    numbers.reduce { |sum, number| sum + number }
  end
end

class Sum3
  def sum(*numbers)
    numbers.sum
  end
end

class Sum4
  def sum(*numbers)
    numbers.inject(0, :+)
  end
end

shared_examples "a summer" do
  it "can add up some numbers" do
    expect(subject.sum(1, 2, 3)).to eq(6)
  end
end

describe Sum do
  it_behaves_like "a summer"
end

describe Sum2 do
  it_behaves_like "a summer"
end

describe Sum3 do
  it_behaves_like "a summer"
end

describe Sum4 do
  it_behaves_like "a summer"
end