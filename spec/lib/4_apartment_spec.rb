require 'spec_helper'

RSpec.describe Apartment do
  lease_start_date = Date.parse("2017/01/1")
  lease_end_date = Date.parse("2020/12/31")
  let(:apartment) { Apartment.new("1600 Pennsylvania Ave NW", "Washington", "DC", "20500", 3, "5", lease_start_date, lease_end_date)}

  describe ".new" do
    it "takes the full mailing address, rent, and lease dates as arguments" do
      expect(apartment).to be_a(Apartment)
    end

    it "should have readers for each variable" do
      expect(apartment.rent).to eq("5")
      expect(apartment.start_date).to eq(lease_start_date)
    end
  end

  describe "#full_address" do
    it "should return the full mailing address" do
      expect(apartment.full_address).to eq("1600 Pennsylvania Ave NW Washington, DC 20500")
    end
  end

  describe "#price" do
    it "should display the price as a string" do
      expect(apartment.price).to be_a(String)
    end

    it "should display the price in a full sentence" do
      expect(apartment.price).to eq("Launch Realty is asking $5 per month for this apartment.")
    end
  end

  describe "#listing" do
    it "should return the full mailing addres and asking price" do
      expect(apartment.listing).to be_a(String)
      expect(apartment.listing).to eq("The apartment at 1600 Pennsylvania Ave NW Washington, DC 20500 will cost you $5 per month.")
    end
  end

  describe "#lease" do
    it "should return the dates of the lease" do
      expect(apartment.lease).to be_a(String)
      expect(apartment.lease).to eq("This lease runs from #{lease_start_date} to #{lease_end_date}.")
    end
  end

  describe "#full?" do
    let(:apartment) { Apartment.new("1600 Pennsylvania Ave NW", "Washington", "DC", "20500", 2, "5", lease_start_date, lease_end_date)}

    it "should check if there are any vacancies in the apartment" do
      expect(apartment.full?).to eq false
    end

    it "should return true if the apartment is occupied" do
      2.times do |i|
        friends = Occupant.new("Squatter", "#{i}")
        apartment.add_item(friends)
      end
      expect(apartment.full?).to eq true
    end
  end

  describe "#add_item" do
    it "should add a roommate to the apartment" do
      roommate1 = Occupant.new("Mia", "Gaulin")
      apartment.add_item(roommate1)
      expect(apartment.items.first).to be_a(Occupant)
    end

    it "should raise an error if there are no empty rooms" do
      3.times do |i|
        friends = Occupant.new("Squatter", "#{i}")
        apartment.add_item(friends)
      end

      roomie = Occupant.new("Another", "squatter")
      expect { apartment.add_item(roomie) }.to raise_error(NoMoreRoom)
    end
  end

  describe "#remove_item" do
    it "should remove a roommate from the apartment" do
      roommate1 = Occupant.new("Mia", "Gaulin")
      apartment.add_item(roommate1)
      apartment.remove_item(roommate1)
      expect(apartment.items).to be_empty

      roommate1 = Occupant.new("Mia", "Gaulin")
      roommate2 = Occupant.new("Imaginary", "Friend")
      apartment.add_item(roommate1)
      apartment.add_item(roommate2)
      apartment.remove_item(roommate1)
      expect(apartment.items.length).to eq 1
    end
  end
end
