require_relative 'occupant'

class Box < Occupant
  attr_accessor :boxes

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @boxes = []
  end
end
