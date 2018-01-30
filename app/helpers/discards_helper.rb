module DiscardsHelper

    def self.validate_card_number_by_discard(card_number)
        Discard.find_by_card_number(card_number).present?
    end
    
end
