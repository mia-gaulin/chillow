#This submission includes refactoring with modules

require_relative 'dwelling'
require_relative 'remove'

class Apartment < Dwelling
  include Remove
  attr_reader :rent, :start_date, :end_date, :capacity

  def initialize(street_address, city_or_town, state, zip_code, bedrooms, rent, start_date, end_date)
    super(street_address, city_or_town, state, zip_code)
    @capacity = bedrooms
    @rent = rent
    @start_date = start_date
    @end_date = end_date
    @items = []
   end

   def price
     "Launch Realty is asking $#{rent} per month for this apartment."
   end

   def listing
     "The apartment at #{street_address} #{city_or_town}, #{state} #{zip_code} will cost you $#{rent} per month."
   end

   def lease
     "This lease runs from #{start_date} to #{end_date}."
   end
end
