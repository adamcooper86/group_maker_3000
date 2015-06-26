require_relative "../app/models/cohort"

describe Cohort do
  let(:cohort){Cohort.find(1)}

  context ".exists?" do
    it "returns true when a class by a true name exists" do
      expect(Cohort.exists "Bumble Bees").to eq(true)
    end
    it "returns false when a class by a false name doesn't exist" do
      expect(Cohort.exists "Jack Daniels").to eq(false)
    end
  end
  context "#make_groups" do
    it "returns a hash" do
      expect(cohort.make_groups).to be_a Hash
    end
    it "returns a hash with sub arrays" do
      expect(cohort.make_groups[0]).to be_an Array
    end
  end
  context "#cohort_information" do
    it "returns a hash" do
      expect(cohort.cohort_information).to be_a Hash
    end
    it "returns a hash with the correct cohort name" do
      expect(cohort.cohort_information[:name]).to eq("Bumble Bees")
    end
    it "returns a hash with an array of student names" do
      expect(cohort.cohort_information[:students]).to be_an Array
    end
    it "returns a hash with an hash of group names" do
      expect(cohort.cohort_information[:groups]).to be_a Hash
    end
  end
end
