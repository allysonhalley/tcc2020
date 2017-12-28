class CardRequest < ApplicationRecord
    
    before_validation :clean_mask

    validates :military_registration, presence: true, length: {is: 7}
    validates :document_reference, presence: true
    validates :reason_request, presence: true
    
    enum reason_request: {change_data: 1, include: 2, promotion: 3, unuseble: 4, reinclude: 5, expired: 6, tired: 7}


    def clean_mask
    self.military_registration.gsub!(/[^0123456789]/, '')
    end

    # Formatação de data para exibição
    def date_formatted
    created_at.strftime('%d/%m/%Y') if created_at?
    end

    # Internationalization (I18n)
    # reason_request: Internationalization (I18n)
    def i18n_reason_request
        StrHelper.attribute_upper(reason_request.to_sym, [:card_request, :reason_requests])
    end
    # Hash reason_requests: Internationalization (I18n)
    def self.i18n_reason_requests(hash = {})
        reason_requests.each_key do |key|
            hash[StrHelper.attribute_upper(key.to_sym, [:card_request, :reason_requests])] = key
        end
        hash
    end
end    