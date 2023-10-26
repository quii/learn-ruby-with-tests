class Greeter
  @greetings = {
    :English => "Hello",
    :Spanish => "Hola",
    :French => "Bonjour"
  }

  def greet(name = "World", language = :English)
    "#{@greetings[language]}, #{name}!"
  end
end

describe "Greeter" do
  subject { Greeter.new }

  context "When greeting" do
    it "should greet the world" do
      expect(subject.greet).to eq("Hello, World!")
    end

    it "should greet a specific person" do
      expect(subject.greet("Alice")).to eq("Hello, Alice!")
    end

    it "should greet a specific person in spanish" do
      expect(subject.greet("Alice", :Spanish)).to eq("Hola, Alice!")
    end

    it "should greet someone in french" do
      expect(subject.greet("Alice", :French)).to eq("Bonjour, Alice!")
    end
  end
end