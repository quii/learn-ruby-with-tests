require_relative '../../lib/greet/greeter.rb'
require_relative '../../lib/greet/greeter2.rb'
require 'securerandom'

shared_examples "a greeter" do
  let(:name) { SecureRandom.hex }
  let(:language) { :English }

  def greet
    subject.greet(name, language)
  end

  context "with no language set" do
    it "should greet the person in English" do
      expect(greet).to eq("Hello, #{name}!")
    end
  end

  context "with spanish set" do
    let(:language) { :Spanish }

    it "should greet the person in spanish" do
      expect(greet).to eq("Hola, #{name}!")
    end
    context "with name set to Chris" do
      let(:name) { "Chris" }

      it "should greet Chris, in spanish" do
        expect(greet).to eq("Hola, Chris!")
      end
    end
  end

  context "with french set" do
    let(:language) { :French }

    it "should greet the person in french" do
      expect(greet).to eq("Bonjour, #{name}!")
    end
  end
end

describe Greeter do
  it_behaves_like "a greeter"
end

describe Greeter2 do
  it_behaves_like "a greeter"
end