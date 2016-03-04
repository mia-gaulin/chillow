require 'spec_helper'

RSpec.describe Occupant do
  let(:occupant) { Occupant.new("Mia", "Gaulin")}
  
  describe ".new" do
    it "take a first and last name as arguments" do
      expect(occupant).to be_a(Occupant)
    end

    it "should have a reader for first_name and last_name" do
      expect(occupant.first_name).to eq("Mia")
    end
  end

  describe "#full_name" do
    it "should return the occupants name" do
      expect(occupant.full_name).to eq("Mia Gaulin")
    end
  end
end
