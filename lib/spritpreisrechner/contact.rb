module Spritpreisrechner
  class Contact
    attr_reader :telephone, :website, :fax, :mail

    def initialize(contact)
      @telephone = contact[:contact]
      @website = contact[:website]
      @fax = contact[:fax]
      @mail = contact[:mail]
    end

  end
end
