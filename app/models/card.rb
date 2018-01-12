# Classe responsavel por representar Carteiras
class Card < ApplicationRecord
  
  before_save :uppercase_strings
  before_update :uppercase_strings
  
  belongs_to :card_request
  belongs_to :card_status

  def register_and_name
    "#{registration} #{name}"
  end

  # Tornar todas strings upercase
  def uppercase_strings
    name.upcase!
    father_name.upcase!
    mother_name.upcase!
    naturalness.upcase!
  end

  def fill_by_request(object_request_id) 
    card_request = CardRequest.find(object_request_id)
    military = Military.find_by_registration(card_request.military_registration)
    self.name = military.name
    self.hierarchy = military.hierarchy_name
    self.identification = military.identification
    self.father_name = military.father_name
    self.mother_name = military.mother_name
    self.born_date = military.date_formatted
    self.registration = military.registration
    self.naturalness = military.naturalness
    self.vote_number = military.vote_number
    self.vote_zone = military.vote_zone
    self.vote_section = military.vote_section
    self.cpf = military.cpf
    self.digital_factor = military.digital_factor
    self.blood_type = military.i18n_upper_blood_type
    self.blood_factor = military.i18n_upper_blood_factor
    self.firearms = firearms_boolean_convert(military.firearm)
    self.print_date = DateTime.now.strftime('%d/%m/%Y')
    self.card_request = card_request
    self.returned_card = false
  end

  def firearms_boolean_convert(military_firearm)    
    case military_firearm
      when :fit 
        true
      when :unfit 
        false
    end
  end

  def firearms_string_convert
    case self.firearms
      when true
        "APTO"
      when false 
        "INAPTO"
    end
  end

  def self.document_request_name
    abort self.card_request.to_json
    self.card_request.document_reference
  end

end
