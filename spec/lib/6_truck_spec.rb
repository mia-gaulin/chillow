require 'spec_helper'

RSpec.describe Truck do
  let(:truck) { Truck.new(100) }

  describe ".new" do
    it "should accept how many boxes the truck can hold" do
      expect(truck).to be_a(Truck)
      expect(truck.capacity).to eq 100
    end
  end

  describe "#full?" do
    it "should check if the truck is full" do
      expect(truck.full?).to eq false
    end

    it "should return true if the truck is full" do
      100.times do |i|
        boxes = Box.new("Mia", "Gaulin")
        truck.add_item(boxes)
      end
      expect(truck.full?).to eq true
    end
  end

  describe "#add_item" do
    it "should add a box to the truck" do
      box1 = Box.new("Mia", "Gaulin")
      truck.add_item(box1)
      expect(truck.items.first).to be_a(Box)
    end

    it "should raise an error if there is no space on the truck" do
      100.times do |i|
        boxes = Box.new("Mia", "Gaulin")
        truck.add_item(boxes)
      end

      extra_box = Box.new("Another", "box")
      expect { truck.add_item(extra_box) }.to raise_error(NoMoreRoom)
    end
  end

  describe "#remove_item" do
    it "should remove a box from the truck" do
      box1 = Box.new("Mia", "Gaulin")
      truck.add_item(box1)
      truck.remove_item(box1)
      expect(truck.items).to be_empty

      box1 = Box.new("Mia", "Gaulin")
      box2 = Box.new("Imaginary", "Friend")
      truck.add_item(box1)
      truck.add_item(box2)
      truck.remove_item(box1)
      expect(truck.items.length).to eq 1

      box1 = Box.new("Mia", "Gaulin")
      box2 = Box.new("Imaginary", "Friend")
      truck.add_item(box1)
      truck.add_item(box1)
      truck.add_item(box2)
      truck.remove_item(box1)
      expect(truck.items.length).to eq 2
    end
  end

  describe "#remove_all" do
    it "should remove all boxes belonging to a particular Occupant" do
      box1 = Box.new("Mia", "Gaulin")
      box2 = Box.new("Imaginary", "Friend")
      25.times do |box1|
        truck.add_item(box1)
      end
      25.times do |box2|
        truck.add_item(box2)
      end
      truck.remove_all(box1)
      expect(truck.items).not_to include(box1)
    end
    it "should leave any boxes belonging to another Occupant" do
      box1 = Box.new("Mia", "Gaulin")
      box2 = Box.new("Imaginary", "Friend")
      25.times do |box|
        truck.add_item(box1)
      end
      25.times do |box|
        truck.add_item(box2)
      end
      truck.remove_all(box1)
      expect(truck.items.length).to eq 25
    end
  end
end
