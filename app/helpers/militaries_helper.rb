module MilitariesHelper

    # return Registration and Name
    def self.register_name(registration)
        military = Military.find_by_registration(registration)
        military.register_and_name
    end

    def self.fit_carry_weapon(fit)        
        case fit
        when true
            StrHelper.system_i18n_upper(:fit, [:helpers, :select])
        when false
            StrHelper.system_i18n_upper(:unfit, [:helpers, :select])
        end
    end
end
