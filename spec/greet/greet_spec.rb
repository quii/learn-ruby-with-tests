require_relative '../../lib/greet/greeter.rb'
require 'securerandom'

shared_examples "a greeter" do
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

describe Greeter do
  it_behaves_like "a greeter"
end

describe Greeter2 do
  it_behaves_like "a greeter"
end