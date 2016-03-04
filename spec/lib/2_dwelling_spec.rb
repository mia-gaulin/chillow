require 'spec_helper'

RSpec.describe Dwelling do
  let(:dwelling) { Dwelling.new("33 Harrison Ave", "Boston", "MA", "02111")}

  describe ".new" do
    it "takes street address, city, state, and zip code as arguments" do
      expect(dwelling).to be_a(Dwelling)
    end

    it "should have readers" do
      expect(dwelling.city_or_town).to eq("Boston")
    end
  end

  describe "#full_address" do
    it "should return the full mailing address" do
      expect(dwelling.full_address).to eq("33 Harrison Ave Boston, MA 02111")
    end
  end
end
