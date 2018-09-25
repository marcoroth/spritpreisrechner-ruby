require 'faraday'
require 'json'

require 'spritpreisrechner/version'
require 'spritpreisrechner/contact'
require 'spritpreisrechner/location'
require 'spritpreisrechner/offer_information'
require 'spritpreisrechner/opening_hour'
require 'spritpreisrechner/payment_arrangement'
require 'spritpreisrechner/payment_method'
require 'spritpreisrechner/price'
require 'spritpreisrechner/region'
require 'spritpreisrechner/response'
require 'spritpreisrechner/station'

module Spritpreisrechner
  @api_base = 'https://api.e-control.at/sprit/1.0/'

  class << self
    attr_accessor :api_base
  end

  def self.conn
    if defined?(@conn)
      @conn
    else
      @conn = Faraday.new(@api_base)
    end
  end

  def self.conn=(conn)
    @conn = conn
  end
end
