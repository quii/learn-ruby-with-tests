# frozen_string_literal: true
class ThirtiesFinderWithPatternMatching
def find_thirties(people)
  people.map do |person|
    case person
    in { age: 30..39 }
      person
    else
      nil
    end
  end
end
end

module ThirtiesFinderWithFilter
  def self.find_thirties(people)
    people.select { |person| person[:age].between?(30, 39) }
  end
end

shared_examples "filtering" do |filterer|
  subject { filterer.find_thirties(people) }

  context "with two people in their 30s" do
    let(:people) do
      [
        { name: "Chris", age: 32 },
        { name: "Pepper", age: 2 },
        { name: "Brian", age: 33 }
      ]
    end

    it { is_expected.to include({ name: "Chris", age: 32 }) }
    it { is_expected.to include({ name: "Brian", age: 33 }) }
  end

  context "with one person in their 30s" do
    let(:people) do
      [
        { name: "Chris", age: 32 },
        { name: "Pepper", age: 2 },
        { name: "Brian", age: 29 }
      ]
    end

    it { is_expected.to include({ name: "Chris", age: 32 }) }
  end
end

describe ThirtiesFinderWithPatternMatching do
  it_behaves_like "filtering" , ThirtiesFinderWithPatternMatching.new
end

describe ThirtiesFinderWithFilter do
  it_behaves_like "filtering" , ThirtiesFinderWithFilter
end