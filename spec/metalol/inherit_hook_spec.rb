
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

describe "the inherit hook" do
  it "fuck off" do
    expect(BaseClass.thesubclasses).to eq([SubClass])
  end
end

