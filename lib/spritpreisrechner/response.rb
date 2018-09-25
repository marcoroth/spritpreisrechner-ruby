module Spritpreisrechner
  class Response
    attr_reader :uuid, :errors, :code, :name
    attr_accessor :stations

    def initialize(response)
      @uuid = response[:uuid] rescue nil
      @errors = response[:errors] rescue []
      @code = response[:code] rescue nil
      @name = response[:name] rescue nil
      @stations = []
    end

    def success?
      @errors.empty?
    end

    def error?
      @errors.any?
    end

    def any?
      @stations.any?
    end

    def count
      @stations.count
    end

  end
end
