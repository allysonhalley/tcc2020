module DiscardsHelper

    def validate_card_number_by_card(card_number)
        Card.find_by_card_number(card_number).present?
    end
    
end
