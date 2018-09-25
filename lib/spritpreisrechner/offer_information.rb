module Spritpreisrechner
  class OfferInformation
    attr_reader :service, :self_service, :unattended

    def initialize(offer_information)
      @service = offer_information[:service]
      @self_service = offer_information[:selfService]
      @unattended = offer_information[:unattended]
    end

    def service?
      @service == true
    end

    def self_service?
      @self_service == true
    end

    def unattended?
      @unattended == true
    end

  end
end
