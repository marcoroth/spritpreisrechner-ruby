module Spritpreisrechner
  class Region
    attr_reader :code, :type, :name, :sub_regions, :postal_codes

    def initialize(region)
      @code = region[:code]
      @type = region[:type]
      @name = region[:name]
      @sub_regions = []

      region[:subRegions].each do |sub_region|
        @sub_regions << Region.new(sub_region)
      end

      @postal_codes = region[:postalCodes]
    end

    def self.all
      response = conn.get('regions')
      attributes = JSON.parse(response.body, symbolize_names: true)

      regions = []

      attributes.each do |region|
        regions << Region.new(region)
      end

      regions
    end

    def self.find(code)
      all.select { |r| r.code == code }.first
    end

    def self.conn
      Spritpreisrechner.conn
    end
    
  end
end
