
describe "anonymous classes" do
  subject(:klass) do
    Class.new do
      def self.name
        "AnonymousClass"
      end
    end
  end

  it "can be created with Class.new" do
    expect(klass.name).to eq("AnonymousClass")
  end
end