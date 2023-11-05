class VeryPrivate
  private
  def private_method
    "private"
  end
end

describe VeryPrivate do
  describe "#private_method" do
    it "should be private" do
      expect { subject.private_method }.to raise_error(NoMethodError)
    end
  end
  describe "can call private methods with send" do
    it "should be private" do
      expect(subject.send(:private_method)).to eq("private")
    end
  end
  describe "public_send if you want to invoke safely" do
    it "should be private" do
      expect { subject.public_send(:private_method) }.to raise_error(NoMethodError)
    end
  end
end