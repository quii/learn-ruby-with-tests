
class BaseClass
  @@subclasses = []

  def self.inherited(subclass)
    @@subclasses << subclass
  end

  def self.the_sub_classes
    @@subclasses
  end
end

class SubClass < BaseClass

end

class ADifferentSubClass < BaseClass

end

describe "BaseClass" do
  it "can track what has inherited it" do
    expect(BaseClass.the_sub_classes).to eq([SubClass, ADifferentSubClass])
  end
end

