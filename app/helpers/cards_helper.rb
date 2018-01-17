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
end
