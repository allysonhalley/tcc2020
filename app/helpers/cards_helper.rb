module CardsHelper
    def self.fit_carry_weapon(fit)        
        case fit
        when true
            StrHelper.system_i18n_upper(:fit, [:helpers, :select])
        when false
            StrHelper.system_i18n_upper(:unfit, [:helpers, :select])
        end
    end

    def self.returned_old_card(returned)        
        case returned
        when true
            StrHelper.system_i18n_upper(:returned, [:helpers, :select])
        when false
            StrHelper.system_i18n_upper(:unreturned, [:helpers, :select])
        end
    end

    # return Registration and Name
    def self.register_name(registration)
        card = Card.find_by_registration(registration)
        card.register_and_name
    end

    # Verificacao para nova solicitacao
    def self.card_printed_exist(registration)
        Card.joins(:card_status).where(card_statuses: {describe: "PRINTED"}).where(registration: registration).present?
    end
end
