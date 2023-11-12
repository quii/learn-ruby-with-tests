# frozen_string_literal: true

describe "procs" do
  subject{ Proc.new { |x| x + 1 } }

  it "can be called with call" do
    expect(subject.call(1)).to eq(2)
  end

  it "can be called with .()" do
    expect(subject.(1)).to eq(2)
  end

  context "with collections" do
    let(:collection) { [1, 2, 3] }

    it "can be used with each" do
      collection.each(&subject)
      expect(collection).to eq([1, 2, 3])
    end

    it "can be used with map" do
      expect(collection.map(&subject)).to eq([2, 3, 4])
    end
  end

end
