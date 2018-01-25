# Class metodos que auxiliam CardRequest
module CardRequestsHelper
  # return Registration and Name
  def self.register_and_name(request_id)    
    card_request = CardRequest.find_by_id(request_id)
    card = Card.find_by_registration(card_request.registration)
    card.register_and_name
  end

  # Validar se solicitacao ja existe
  def self.request_exist(document, registration)
    registration = registration.gsub!(/[^0123456789]/, '')
    CardRequest.where(military_registration: registration, canceled: false).present?
  end
end
