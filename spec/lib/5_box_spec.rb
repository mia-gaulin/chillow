require 'spec_helper'

RSpec.describe Box do
  let(:box) { Box.new("Mia", "Gaulin") }
  describe ".new" do
    it "should accept the name of its owner" do
      expect(box.full_name).to eq("Mia Gaulin")
    end

    it "should store all Box objects in an array" do
      expect(box.boxes).to be_a(Array)
    end
  end
end
