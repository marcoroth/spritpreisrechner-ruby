module Spritpreisrechner
  class Price
    attr_reader :fuel_type, :amount, :label

    def initialize(price)
      @fuel_type = price[:fuelType]
      @amount = price[:amount]
      @label = price[:label]
    end

  end
end
