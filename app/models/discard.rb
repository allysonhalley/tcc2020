# Classe responsavel por representar Discartes
class Discard < ApplicationRecord
  belongs_to :card_request

  # Validacoes
  validates :card_number, presence: true, uniqueness: true

  def fill_by_request(object_request_id)
    card_request = CardRequest.find(object_request_id)
    card = Card.find_by_registration(card_request.military_registration)
    self.card_request = card_request
    self.card_number = card.card_number
  end

  def document_request_reference
    card_request.document_reference
  end

  def card_request_id
    card_request.id
  end

  # return Registration and Name
  def register_and_name
    card_request = CardRequest.find_by_id(card_request_id)
    military = Military.find_by_registration(card_request.military_registration)
    military.register_and_name
  end

end
