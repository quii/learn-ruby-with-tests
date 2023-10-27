
class BaseClass
  @@subclasses = []

  def self.inherited(subclass)
    @@subclasses << subclass
  end

  def self.thesubclasses
    @@subclasses
  end
end

class SubClass < BaseClass

end

class ADifferentSubClass < BaseClass

end

describe "BaseClass" do
  it "can track what has inherited it" do
    expect(BaseClass.thesubclasses).to eq([SubClass, ADifferentSubClass])
  end
end

