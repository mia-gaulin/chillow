class Dwelling
  attr_reader :street_address, :city_or_town, :state, :zip_code

  def initialize(street_address, city_or_town, state, zip_code)
    @street_address = street_address
    @city_or_town = city_or_town
    @state = state
    @zip_code = zip_code
  end

  def full_address
    "#{street_address} #{city_or_town}, #{state} #{zip_code}"
  end
end
