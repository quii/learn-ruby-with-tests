require_relative '../../lib/greet/greeter.rb'
require_relative '../../lib/greet/greeter2.rb'
require 'securerandom'

shared_context "in Spanish" do
  let(:language) { :Spanish }
end

shared_context "in French" do
  let(:language) { :French }
end

shared_context "in English" do
  let(:language) { :English }
end

shared_examples "a greeter" do

  def greet
    subject.greet(name, language)
  end

  context "with no name" do
    let(:name) { nil }

    context "with no language" do
      let(:language) { nil }

      it "should greet the world in English" do
        expect(greet).to eq("Hello, World!")
      end
    end

    context "with the language set to Spanish" do
      include_context "in Spanish"

      it "should greet the world in Spanish" do
        expect(greet).to eq("Hola, World!")
      end
    end

    context "with the language set to French" do
      include_context "in French"

      it "should greet the world in French" do
        expect(greet).to eq("Bonjour, World!")
      end
    end
  end

  context "with a name set" do
    let(:name) { SecureRandom.hex }

    context "with language set to English" do
      include_context "in English"

      it "should greet the person in English" do
        expect(greet).to eq("Hello, #{name}!")
      end

      context "with name set to Chris" do
        let(:name) { "Chris" }

        it "should greet Chris in English" do
          expect(greet).to eq("Hello, Chris!")
        end
      end
    end

    context "with language set to Spanish" do
      include_context "in Spanish"

      it "should greet the person in Spanish" do
        expect(greet).to eq("Hola, #{name}!")
      end
    end

    context "with language set to French" do
      include_context "in French"

      it "should greet the person in French" do
        expect(greet).to eq("Bonjour, #{name}!")
      end
    end
  end
end

describe Greeter do
  it_behaves_like "a greeter"
end

describe Greeter2 do
  it_behaves_like "a greeter"
end