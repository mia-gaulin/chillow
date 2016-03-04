#This submission includes refactoring with modules

require_relative 'box'
require_relative 'remove'

class Truck < Box
  include Remove
  attr_accessor :capacity

  def initialize(capacity)
    @capacity = capacity
    @items = []
  end

  def remove_all(box)
    @items.delete_if {|k| k == box }
  end
end
