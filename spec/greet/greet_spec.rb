require_relative '../../lib/greet/greeter.rb'
require_relative '../../lib/greet/greeter2.rb'

shared_context "in Spanish" do
  let(:language) { :Spanish }
end

shared_context "in French" do
  let(:language) { :French }
end

shared_context "in English" do
  let(:language) { :English }
end

shared_examples "a greeter" do |greeter|
  subject { greeter.greet(name, language) }

  context "with no name" do
    let(:name) { nil }

    context "with no language" do
      let(:language) { nil }

      it {is_expected.to eq("Hello, World!")}
    end

    context "with the language set to Spanish" do
      include_context "in Spanish"

      it {is_expected.to eq("Hola, World!")}
    end

    context "with the language set to French" do
      include_context "in French"

      it {is_expected.to eq("Bonjour, World!")}
    end
  end

  context "with a name set" do
    let(:name) { "Pepper" }

    context "with language set to English" do
      include_context "in English"

      it {is_expected.to eq("Hello, #{name}!")}

      context "with name set to Chris" do
        let(:name) { "Chris" }

        it {is_expected.to eq("Hello, Chris!")}
      end
    end

    context "with language set to Spanish" do
      include_context "in Spanish"

      it {is_expected.to eq("Hola, #{name}!")}
    end

    context "with language set to French" do
      include_context "in French"

      it {is_expected.to eq("Bonjour, #{name}!")}
    end
  end
end

describe Greeter do
  it_behaves_like "a greeter", Greeter.new
end

describe Greeter2 do
  it_behaves_like "a greeter", Greeter2
end