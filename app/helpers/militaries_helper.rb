module MilitariesHelper
  # return Registration and Name
  def self.hierarchy_register_and_name(registration)
    military = Military.find_by_registration(registration)
    military.hierarchy_register_and_name
  end

  def self.fit_carry_weapon(fit)
    case fit
    when true
      StrHelper.system_i18n_upper(:fit, %i[helpers select])
    when false
      StrHelper.system_i18n_upper(:unfit, %i[helpers select])
    end
  end
end
