module Spritpreisrechner
  class PaymentMethod
    attr_reader :cash, :debit_card, :credit_card, :others

    def initialize(payment_method)
      @cash = payment_method[:cash]
      @debit_card = payment_method[:debitCard]
      @credit_card = payment_method[:creditCard]
      @others = payment_method[:others]&.split(', ')
    end

    def cash?
      @cash == true
    end

    def debit_card?
      @debit_card == true
    end

    def credit_card?
      @debit_card == true
    end

  end
end
