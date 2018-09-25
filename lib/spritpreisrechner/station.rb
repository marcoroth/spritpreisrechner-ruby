module Spritpreisrechner
  class Station
    attr_reader :id, :name, :other_service_offers, :position, :open, :distance
    attr_reader :location, :contact, :opening_hours, :offer_information, :payment_methods, :payment_arrangements, :prices

    FUEL_TYPES = %w[DIE SUP GAS].freeze
    REGION_TYPES = %w[BL PB].freeze

    def initialize(station)
      @id = station[:id]
      @name = station[:name]
      @location = Location.new(station[:location])
      @contact = Contact.new(station[:contact])
      @opening_hours = []
      @offer_information = OfferInformation.new(station[:offerInformation])
      @payment_methods = PaymentMethod.new(station[:paymentMethods])
      @payment_arrangements = PaymentArrengement.new(station[:paymentArrangements])
      @other_service_offers = station[:otherServiceOffers]&.split(', ')
      @position = station[:position].to_i
      @open = station[:open]
      @distance = station[:distance].to_f
      @prices = []

      station[:openingHours].each do |opening_hour|
        @opening_hours << OpeningHour.new(opening_hour)
      end

      station[:prices].each do |price|
        @prices << Price.new(price)
      end
    end


    def self.by_address(lat: nil, lng: nil, fuel_type: 'DIE', closed: 'true')
      errors = []
      errors << 'you need to submit a valid latitude coordinate' if lat.nil?
      errors << 'you need to submit a valid longitude coordinate' if lng.nil?
      errors << "you need to submit a valid Fuel Type. The options are #{FUEL_TYPES}" if fuel_type.nil? || !FUEL_TYPES.include?(fuel_type)
      return Response.new(errors: errors) if errors.any?

      response = conn.get('search/gas-stations/by-address', latitude: lat, longitude: lng, fuelType: fuel_type, includeClosed: closed)
      attributes = JSON.parse(response.body, symbolize_names: true)
      response = Response.new(attributes)
      response.stations = []

      if response.success?
        attributes.each do |station|
          response.stations << Station.new(station)
        end
      end

      response
    end

    def self.by_region(code: nil, region_type: nil, fuel_type: 'DIE', closed: 'true')
      errors = []
      errors << 'you need to submit a valid region code' if code.nil?
      errors << "you need to submit a valid region type. The options are #{REGION_TYPES}" if region_type.nil? || !REGION_TYPES.include?(region_type)
      errors << "you need to submit a valid Fuel Type. The options are #{FUEL_TYPES}" if fuel_type.nil? || !FUEL_TYPES.include?(fuel_type)
      return Response.new(errors: errors) if errors.any?

      response = conn.get('search/gas-stations/by-region', code: code, type: region_type, fuelType: fuel_type, includeClosed: closed)
      attributes = JSON.parse(response.body, symbolize_names: true)
      response = Response.new(attributes)
      response.stations = []

      if response.success?
        attributes.each do |station|
          response.stations << Station.new(station)
        end
      end

      response
    end

    def self.conn
      Spritpreisrechner.conn
    end

  end
end
