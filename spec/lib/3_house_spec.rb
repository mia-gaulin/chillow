require 'spec_helper'

RSpec.describe House do
  let(:house) { House.new("33 Harrison Ave", "Boston", "MA", "02111", "15500")}

  describe ".new" do
    it "takes the full mailing address and asking price as arguments" do
      expect(house).to be_a(House)
    end

    it "should have readers for each variable" do
      expect(house.asking_price).to eq("15500")
    end
  end

  describe "#full_address" do
    it "should return the full mailing address" do
      expect(house.full_address).to eq("33 Harrison Ave Boston, MA 02111")
    end
  end

  describe "#price" do
    it "should display the price as a string" do
      expect(house.price).to be_a(String)
    end

    it "should display the price in a full sentence" do
      expect(house.price).to eq("Launch Realty is asking $15500 for this home.")
    end
  end

  describe "#listing" do
    it "should return the full mailing addres and asking price" do
      expect(house.listing).to be_a(String)
      expect(house.listing).to eq("The home at 33 Harrison Ave Boston, MA 02111 will cost you $15500.")
    end
  end
end
