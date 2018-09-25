module Spritpreisrechner
  class OpeningHour
    attr_reader :day, :label, :order, :from, :to

    def initialize(opening_hour)
      @day = opening_hour[:day]
      @label = opening_hour[:label]
      @order = opening_hour[:order]
      @from = opening_hour[:from]
      @to = opening_hour[:to]
    end
  end
end
