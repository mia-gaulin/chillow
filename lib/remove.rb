module Remove
  attr_accessor :items

  def full?
    items.length == capacity
  end

  def add_item(item)
    if items.length < capacity
      @items << item
    else
      raise NoMoreRoom
    end
  end

  def remove_item(item)
    @items.delete(item)
  end
end
