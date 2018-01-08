# Classe responsavel por representar Carteiras
class Card < ApplicationRecord
  
  
  belongs_to :card_request
  belongs_to :card_status

  def register_and_name
    "#{registration} #{name}"
  end

end
