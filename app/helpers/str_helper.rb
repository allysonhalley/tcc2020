module StrHelper
    def self.upper(i18n)
        I18n.t(i18n).mb_chars.upcase.to_s
    end
  end