module Spritpreisrechner
  class PaymentArrengement
    attr_reader :cooperative, :club_card

    def initialize(payment_arrengement)
      @cooperative = payment_arrengement[:cooperative]
      @club_card = payment_arrengement[:clubCard]
    end

    def cooperative?
      @cooperative == true
    end

    def club_card?
      @club_card == true
    end

  end
end
