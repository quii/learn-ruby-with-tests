describe "adding singleton methods" do
  subject { "some string" }

  context "adding a bob method which reverses the string" do
    before do
      def subject.bob
        reverse
      end
    end

    it "should reverse the string" do
      expect(subject.bob).to eq("gnirts emos")
    end
  end
end