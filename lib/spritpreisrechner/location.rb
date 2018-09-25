module Spritpreisrechner
  class Location
    attr_reader :address, :postal_code, :city, :longitude, :latitude

    def initialize(location)
      @address = location[:address]
      @postal_code = location[:postalCode]
      @city = location[:city]
      @longitude = location[:longitude]
      @latitude = location[:latitude]
    end

  end
end
