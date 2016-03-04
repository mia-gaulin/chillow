require_relative 'dwelling'

class House < Dwelling
  attr_reader :asking_price

  def initialize(street_address, city_or_town, state, zip_code, asking_price)
    super(street_address, city_or_town, state, zip_code)
    @asking_price = asking_price
   end

   def price
     "Launch Realty is asking $#{asking_price} for this home."
   end

   def listing
     "The home at #{street_address} #{city_or_town}, #{state} #{zip_code} will cost you $#{asking_price}."
   end
end
