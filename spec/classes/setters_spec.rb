class MutablePerson
  def initialize(name)
    @name = name
  end

  def name=(name)
    @name = name
  end

  def name
    @name
  end
end

class MutablePerson2
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

shared_examples "Mutable people" do
  subject { described_class.new("Chris") }
  it "can change its name" do
    expect(subject.name).to eq("Chris")
    subject.name = "Bob"
    expect(subject.name).to eq("Bob")
  end
end

describe MutablePerson do
  it_behaves_like "Mutable people"
end

describe MutablePerson2 do
  it_behaves_like "Mutable people"
end