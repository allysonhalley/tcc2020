# Classe responsavel por representar Carteiras
class Card < ApplicationRecord
  belongs_to :card_request
  belongs_to :card_status
end
