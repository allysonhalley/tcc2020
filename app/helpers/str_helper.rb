module StrHelper
    def self.upper(i18n)
        I18n.t(i18n).mb_chars.upcase.to_s
    end
    def self.attribute_upper(attribute, scopes)
        scopes = [:activerecord, :attributes].concat(scopes)
        I18n.t(attribute, scope: scopes).mb_chars.upcase.to_s
    end

    def self.system_upper(attribute, scopes)
        I18n.t(attribute, scope: scopes).mb_chars.upcase.to_s
    end
  end